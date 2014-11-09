class AddIndexToEntries < ActiveRecord::Migration
  def change
    add_index :entries, :log_id
  end
end
