class AddColumnToRules < ActiveRecord::Migration[5.1]
  def change
    add_column :rules, :max_member, :integer
  end
end
