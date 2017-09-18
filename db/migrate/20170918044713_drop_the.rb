class DropThe < ActiveRecord::Migration[5.1]
  def change
    drop_table :themas
    create_table :themas do |t|
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
