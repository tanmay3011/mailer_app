class AddSentEmailsCountToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :sent_emails_count, :integer
  end
end
