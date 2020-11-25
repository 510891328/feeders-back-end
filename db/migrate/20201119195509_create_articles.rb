class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.belongs_to :user
      t.string :img
      t.string :title
      t.string :summary
      t.string :source
      t.string :url
      t.string :released
      t.string :author

      t.timestamps
    end
  end
end
