class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'uuid-ossp'
    create_table :rooms,id: :uuid do |t|
      t.integer :rule_id
      t.string :name

      t.timestamps
    end
  end
end
