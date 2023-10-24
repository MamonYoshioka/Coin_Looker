class Admin::PostScriptCommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]
  def destroy
    post_script_comment = PostScriptComment.find(params[:id])
    post_script_comment.destroy
    redirect_back(fallback_location: admin_facilities_path)
  end
end
