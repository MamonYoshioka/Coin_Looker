class Admin::PostScriptsController < ApplicationController
  def index
  end

  def show
    @post_script = PostScript.find(params[:id])
    #@post_script_comments = @post_script.post_script_comments
  end
end
