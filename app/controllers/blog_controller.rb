class BlogController < ApplicationController
  before_action :set_blogs, only: %i[show]
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

    @blog = Blog.friendly.find(params[:id])
    set_meta_tags title: @blog.seo_title,
                  description: @blog.seo_description,
                  type: "website",
                  keywords: @blog.seo_keywords,
                  url: url_for(@blog),
                  author: "#{@blog.admin.first_name} #{@blog.admin.last_name}",
                  publish_date: @blog.published_at.to_date,
                  og: {
                    title: @blog.seo_title,
                    description: @blog.seo_description,
                    type: "website",
                    url: url_for(@blog),
                    image: @blog.seo_image.attached? ? "https://truckerjobs.s3.us-east-2.amazonaws.com/#{@blog.seo_image.key}" : url_for(@blog.cover_image),
                    image_alt: @blog.seo_image_alt,
                    site: "TRUCKERJOBS4U.com"
                  }
    if current_admin&.role&.in?(["admin", "advisor"])
      @blog = Blog.friendly.find(params[:id])
    else
      @blog = Blog.published.friendly.find(params[:id])
    end
  end

  private

  def set_blogs
    if current_admin&.role&.in?(["admin", "advisor"])
      @blog = Blog.sorted
    else
      @blog = Blog.published.sorted
    end
  end
end
