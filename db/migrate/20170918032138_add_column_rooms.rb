class AddColumnRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms,:users_count,:integer
  end
end
