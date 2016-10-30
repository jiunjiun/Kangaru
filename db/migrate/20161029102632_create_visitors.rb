class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :identifier
      t.string :name
      t.string :avatar
      t.references :company, foreign_key: true
      t.references :adapter, foreign_key: true

      t.timestamps
    end
  end
end
