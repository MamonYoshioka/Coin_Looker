class Admin::PostScriptsController < ApplicationController
  def index
  end

  def show
    @post_script = PostScript.find(params[:id])
  end
end
