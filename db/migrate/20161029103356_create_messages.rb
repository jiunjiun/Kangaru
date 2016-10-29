class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :visitor, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :kind
      t.references :template, polymorphic: true

      t.timestamps
    end
  end
end
