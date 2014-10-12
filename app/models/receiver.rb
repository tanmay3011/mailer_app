class Receiver < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :email, counter_cache: true

  before_create :check_receiver_limit
  after_create :add_receiver_in_contacts
  private
    def check_receiver_upper_limit
      self.email.receivers_count < 20
    end

    def add_receiver_in_contacts
      sender = self.email.sending_mailbox
      self.mailbox.contacts.create(firstname: sender.firstname, lastname: sender.firstname, email: sender.email)
    end
end
