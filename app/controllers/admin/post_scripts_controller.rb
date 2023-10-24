class Admin::PostScriptsController < ApplicationController
  def index
  end

  def show
    @post_script = PostScript.find(params[:id])
    @post_script_comments = @post_script.post_script_comments
  end

  def destroy
    @post_script = PostScript.find(params[:id])
    @post_script.destroy
    redirect_to admin_facilities_path

    #comment = PostScriptComment.find(params[:id])
    #comment.destroy
    #redirect_back(fallback_location: admin_facilities_path)
  end
end
