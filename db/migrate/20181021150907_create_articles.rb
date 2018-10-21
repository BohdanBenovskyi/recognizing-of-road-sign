class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :preview
      t.text :content
      t.string :thumbnail

      t.timestamps
    end
  end
end
