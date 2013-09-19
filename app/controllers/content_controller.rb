class ContentController < ApplicationController
  def show
    @content = Content.new(params[:course], params[:number])
  end
end
