class RemoveEntryFromLogs < ActiveRecord::Migration
  def change
    remove_column :logs, :entry
  end
end
