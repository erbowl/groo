class AddColumnToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :thema_id, :integer
  end
end
