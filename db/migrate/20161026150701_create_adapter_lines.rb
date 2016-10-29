class CreateAdapterLines < ActiveRecord::Migration[5.0]
  def change
    create_table :adapter_lines do |t|
      t.string :secret
      t.string :access_token

      t.timestamps
    end
  end
end
