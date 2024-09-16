class Blog::CoverImagesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_blog

  def destroy
    @blog.cover_image.purge_later

    respond_to do |format|
      format.html { redirect_to advisor_edit_blog_path(@blog) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@blog, :cover_image)) }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
