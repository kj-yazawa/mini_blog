class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    # @blog = Blog.where("id = #{params[:id]}").limit(1).first
    @entries = Entry.where(blog_id: params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_url, notice: "ブログ「#{@blog.title}」を登録しました。"
    else
      render :new
    end
  end

  def update
    blog = Blog.find(params[:id])
    blog.update!(blog_params)
    redirect_to blogs_url, notice: "ブログ「#{blog.title}」を更新しました。"
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy!
    redirect_to blogs_url, notice: "ブログ「#{blog.title}」を削除しました。"
  end

  private

  def blog_params
    params.require(:blog).permit([:title, :category, :avatar])
  end
end
