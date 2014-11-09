class AddIndexToFriends < ActiveRecord::Migration
  def change
    add_index :friends, :contact_id
  end
end
