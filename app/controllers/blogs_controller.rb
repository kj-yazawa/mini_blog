class BlogsController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
    @blogs = Blog.all
  end
end
