class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :snippet
      t.references :parent, index: true
      t.integer :author_id
      t.string :title # null:false, default: ""
      t.text :content # null:false, default: ""
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
