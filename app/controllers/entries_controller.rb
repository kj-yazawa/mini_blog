class EntriesController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new()
  end

  def edit
  end

  def show
  end
  
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to blog_url(params[:blog_id]), notice: "エントリー「#{@entry.title}」を登録しました。"
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :body).merge(blog_id: params[:blog_id])
  end
end
