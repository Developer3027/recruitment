class BlogController < ApplicationController
  before_action :set_blogs
  # GET /blog
  #
  # Shows all blogs if user is an admin or advisor, otherwise only published blogs.
  def index; end

  # GET /blog/:id
  #
  # Shows a single blog if user is an admin or advisor, otherwise only published blogs.
  def show
    @blog = Blog.friendly.find(params[:id])
    set_meta_tags title: @blog.seo_title,
                  description: @blog.seo_description,
                  image: @blog.seo_image.attached? ? "https://truckerjobs.s3.us-east-2.amazonaws.com/#{@blog.seo_image.key}" : "https://truckerjobs.s3.us-east-2.amazonaws.com/#{@blog.cover_image.key}",
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
                    image: @blog.seo_image.attached? ? "https://truckerjobs.s3.us-east-2.amazonaws.com/#{@blog.seo_image.key}" : "https://truckerjobs.s3.us-east-2.amazonaws.com/#{@blog.cover_image.key}",
                    image_alt: @blog.seo_image_alt,
                    site: "TRUCKERJOBS4U.com"
                  }
    @blog.update(views: @blog.views + 1)
    # set_blogs
  end

  private

  # Before filter for blog index and show actions.
  #
  # If a user is signed in as an admin or advisor, show all blogs.
  # Otherwise, show only published blogs.
  def set_blogs
    if current_admin&.role&.in?(["admin", "advisor"])
      @blog = Blog.sorted.includes([ :admin, :rich_text_content, cover_image_attachment: { blob: [] }])
    else
        @blog = Blog.published.sorted.includes([:admin, :rich_text_content, cover_image_attachment: { blob: [] }])
    end
  end
end
