class NoticeMailer < ApplicationMailer
  default from: "noreply@example.com"

  def sendmail_confirm(blog_id, entry_id, comment_id)
    @blog = Blog.find(blog_id)
    @entry = Entry.find(entry_id)
    @comment = Comment.find(comment_id)
    mail to: "admin@example.com",
    subject: "新しいコメントが投稿されました"
  end
end
