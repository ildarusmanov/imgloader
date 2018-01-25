class CreateSourcelinks < ActiveRecord::Migration[5.1]
  def change
    create_table :sourcelinks do |t|
      t.string :url

      t.timestamps
    end
  end
end
