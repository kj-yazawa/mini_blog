class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def show
  end

  def edit
  end

  def index
    @blogs = Blog.all
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      redirect_to blogs_url, notice: "ブログ「#{blog.title}」を登録しました。"
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title)
  end
end
