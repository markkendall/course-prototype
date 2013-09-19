class ContentRenderer < Redcarpet::Render::HTML
  include ERB::Util

  attr_reader :code_blocks

  def initialize(section_number, options = {})
    @section_number = section_number
    @code_blocks = {}
    super(options)
  end

  def doc_header
    %Q{<course-section number="#{@section_number}">}
  end

  def doc_footer
    %Q{</course-section>}
  end

  def block_code(code, language)
    code = code.strip
    if language =~ /bah-.*/
      code_blocks[language.match(/bah-(.*)/)[1]] = code
      if language == 'bah-hint'
        %Q{
          <challenge-hint>#{code}</challenge-hint>
        }
      end
    else
      %Q{
        <challenge-editor language="#{language}" content="#{html_escape(code)}"></challenge-editor>
      }
    end
  end
end
