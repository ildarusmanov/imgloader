class CreateSourcelinks < ActiveRecord::Migration[5.1]
  def change
    create_table :sourcelinks do |t|
      t.string :url
      t.index :url, unique: true

      t.timestamps
    end
  end
end
