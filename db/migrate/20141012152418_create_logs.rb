class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :entry
      t.belongs_to :mailbox
      t.timestamps null: false
    end
  end
end
