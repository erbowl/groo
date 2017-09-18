class CreateThemas < ActiveRecord::Migration[5.1]
  def change
    create_table :themas, id: :uuid do |t|
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
