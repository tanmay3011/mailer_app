class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.belongs_to :mailbox
      t.belongs_to :email
      t.integer :receiver_count
      t.string :type

      t.timestamps
    end
  end
end
