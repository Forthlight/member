class AddColumnToMemberUsers < ActiveRecord::Migration
  def change
    add_column :member_users, :description, :text
  end
end
