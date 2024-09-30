class AdvisorController < ApplicationController
  # Only allow admins to access the admin dashboard
  before_action :authenticate_staff!


  def index
    @blog = Blog.new
    @blogs = Blog.includes([:rich_text_content, cover_image_attachment: { blob: [] }]).order(created_at: :desc)
  end

  def new_blog
    @blog = Blog.new
  end

  def list_blogs
    @blogs = Blog.all.includes([:rich_text_content, cover_image_attachment: { blob: [] }])
  end

  def edit_blog
    @blog = Blog.includes([:rich_text_content, cover_image_attachment: { blob: [] }]).friendly.find(params[:id])
  end

  def create_blog
    @blog = Blog.new(blog_params)
    @blog.admin = current_admin
    if @blog.save
      @blog.update(views: @blog.views + 1)
      redirect_to advisor_list_blogs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_blog
    @blog = Blog.friendly.find(params[:id])
    if @blog.update(blog_params)
      redirect_to advisor_list_blogs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy_blog
    @blog = Blog.friendly.find(params[:id])
    @blog.destroy
    redirect_to advisor_list_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:cover_image,
                                    :title,
                                    :content,
                                    :published_at,
                                    :seo_image,
                                    :seo_image_alt,
                                    :seo_title,
                                    :seo_description,
                                    :seo_keywords,
                                    :user_id)
  end

  # Before filter to ensure only staff (admins and advisors) can access the
  # advisor dashboard.
  #
  # If the user is not signed in or the user is not an admin or advisor, redirect
  # to the root path and alert the user that they are not authorized to access
  # the page.
  def authenticate_staff!
    if !admin_signed_in? || !["admin", "advisor"].include?(current_admin.role)
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end
end
