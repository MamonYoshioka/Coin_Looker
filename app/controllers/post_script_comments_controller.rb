class PostScriptCommentsController < ApplicationController
  def create
    post_script = PostScript.find(params[:post_script_id])
    comment = current_end_user.post_script_comments.new(post_script_comment_params)
    comment.post_script_id = post_script.id
    redirect_to request.referer
  end

    def destroy
      comment = PostScriptComment.find(params[:id])
      comment.destroy
    end

  private
  def post_script_comment_params
    params.require(:post_script_comment).permit(:comment)
  end
end
