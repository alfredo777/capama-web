class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.string :type
      t.boolean :active
      t.string :head_image

      t.timestamps
    end
    add_index :blog_posts, :type
  end
end
