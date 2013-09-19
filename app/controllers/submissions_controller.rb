
class SubmissionsController < ApplicationController
  def create
    content = Content.new(params[:course], params[:number])
    result = content.execute_challenge(params[:challenge], params[:code])
    current_user.complete!(params[:challenge]) unless result['failures'].present?
    render json: result
  end
end
