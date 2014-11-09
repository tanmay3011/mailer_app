class AddDetailsToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :subject, :text
    add_column :emails, :priority, :integer
    add_index :emails, :email_id
    add_index :emails, :mailbox_id
  end
end
