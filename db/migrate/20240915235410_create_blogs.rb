class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.datetime :published_at
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
