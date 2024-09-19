class AddColumnsToBlog < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :seo_title, :text
    add_column :blogs, :seo_description, :text
    add_column :blogs, :seo_keywords, :text, default: [], array: true
    add_column :blogs, :seo_image, :text
    add_column :blogs, :seo_image_alt, :text
    add_column :blogs, :seo_type, :string
  end
end
