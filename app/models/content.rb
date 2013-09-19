class Content
  DOT_OR_SLASH = %r{\.|/}

  attr_reader :course
  attr_reader :number
  attr_reader :parent
  attr_reader :children

  def initialize(course, number, include_children = true, parent = nil)
    @course = course
    @number = determine_section_number(number)
    @renderer = ContentRenderer.new(number)
    @parent = parent
    @children = include_children ? load_children : []
  end

  def html
    render.output + children.map(&:html).join
  end

  def execute_challenge(challenge_number, user_code)
    section = find_child(challenge_number)
    req = {
      resource: {
        cmd: user_code,
        setup: section.setup_code,
        tests: section.test_code
      }
    }
    HTTParty.post('http://localhost:9292/play', body: req)
  end

  def find_child(section_number)
    if number == section_number
      self
    else
      children.map {|c| c.find_child(section_number)}.compact.first
    end
  end

  %w(setup test output).each do |type|
    define_method "#{type}_code" do
      render
      code = []
      code << @parent.send("#{type}_code") if @parent
      code << @renderer.code_blocks[type]
      code.flatten.join("\n")
    end
  end

  private

  def determine_section_number(number)
    number.split(DOT_OR_SLASH).map(&:to_i).reject {|num| num == 0}.join('.')
  end

  def determine_file_path(number)
    number.split(DOT_OR_SLASH).map {|num| "#{num}-*"}.join('/')
  end

  def dirname
    dir = determine_file_path(number)
    Dir["#{Rails.root}/content/#{course}/#{dir}"].first
  end

  def filename
    file = determine_file_path(number)
    Dir["#{Rails.root}/content/#{course}/#{file}.md"].first
  end

  def load_children
    if dirname
      numbers = Dir["#{dirname}/*"].map {|file| determine_section_number(file)}.reject(&:blank?).uniq
      numbers.map {|number| Content.new(course, number, true, self)}
    else
      []
    end
  end

  def render
    @rendered_content ||= begin
      markdown = Redcarpet::Markdown.new(@renderer, fenced_code_blocks: true)
      text = filename ? File.read(filename) : ''
      Metadown.render(text, markdown)
    end
  end
end
