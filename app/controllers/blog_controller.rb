class BlogController < ApplicationController
  # GET /blog
  #
  # Shows all blogs if user is an admin or advisor, otherwise only published blogs.
  def index
    if current_admin&.role&.in?(["admin", "advisor"])
      @blog = Blog.sorted
    else
      @blog = Blog.published.sorted
    end
  end

  # GET /blog/:id
  #
  # Shows a single blog if user is an admin or advisor, otherwise only published blogs.
  def show
    if current_admin&.role&.in?(["admin", "advisor"])
      @blog = Blog.find(params[:id])
    else
      @blog = Blog.published.find(params[:id])
    end
  end
end
