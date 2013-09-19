class ProgressController < ApplicationController
  def show
    content = Content.new(params[:course], params[:number])

    # TODO: Use params[:course] to look up progress for the requested course
    progress = current_user.completed_challenges.map do |section|
      [section, content.find_child(section).output_code.strip]
    end

    render json: Hash[progress]
  end
end
