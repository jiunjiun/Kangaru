class CreateSenders < ActiveRecord::Migration[5.0]
  def change
    create_table :senders do |t|
      t.string :identifier
      t.string :name
      t.string :avatar
      t.references :user,    foreign_key: true
      t.references :adapter, foreign_key: true

      t.timestamps
    end
  end
end
