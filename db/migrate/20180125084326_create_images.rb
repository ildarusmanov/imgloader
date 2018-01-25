class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :source_url
      t.string :url
      t.references :sourcelink, foreign_key: true

      t.index [:sourcelink_id, :source_url], unique: true

      t.timestamps
    end
  end
end
