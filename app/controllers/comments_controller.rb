class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to blog_entry_url(blog_id: params[:blog_id], id: params[:entry_id]), notice: "コメントを登録しました。"
    else
      redirect_to blog_entry_url(blog_id: params[:blog_id], entry_id: params[:entry_id]), notice: "コメントの登録に失敗しました。"
    end
  end

  def approve
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    comment = Comment.find(params[:id])
    comment.update(approved: true)
    redirect_to blog_entry_path(blog_id: params[:blog_id], id: params[:entry_id]), notice: "コメントを承認しました。"
    # redirect_to controller: :entries, action: :show, notice: "コメントを承認しました。"
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to blog_entry_path(blog_id: params[:blog_id], id: params[:entry_id]), notice: "コメントを削除しました。"
  end

  def comment_params
    params.require(:comment).permit(:body).merge(entry_id: params[:entry_id])
  end
end
