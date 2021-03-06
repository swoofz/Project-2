class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :link
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
