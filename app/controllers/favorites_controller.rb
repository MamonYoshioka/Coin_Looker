class FavoritesController < ApplicationController

  def create
    post_script = PostScript.find(params[:post_script_id])
    favorite = current_end_user.favorites.new(post_script_id: post_script.id)
    favorite.save
    redirect_to post_script_path(post_script)
  end

  def destroy
    post_script = PostScript.find(params[:post_script_id])
    favorite = current_end_user.favorites.find_by(post_script_id: post_script.id)
    favorite.destroy
    redirect_to post_script_path(post_script)
  end

end
