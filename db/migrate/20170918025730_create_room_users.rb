class CreateRoomUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :room_users, id: :uuid do |t|
      t.string :room_id
      t.string :user_id
      t.text :review
      t.string :mvp
      t.timestamps
    end
  end
end
