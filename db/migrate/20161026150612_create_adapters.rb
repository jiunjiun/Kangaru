class CreateAdapters < ActiveRecord::Migration[5.0]
  def change
    create_table :adapters do |t|
      t.references :user, foreign_key: true
      t.references :adaptable, polymorphic: true

      t.timestamps
    end
  end
end
