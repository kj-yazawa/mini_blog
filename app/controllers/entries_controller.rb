class EntriesController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new()
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:id])
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

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to blog_url(params[:blog_id]), notice: "エントリー「#{@entry.title}」を更新しました。"
    else
      render :edit
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :body).merge(blog_id: params[:blog_id])
  end
end
