class Mailbox < ActiveRecord::Base
  has_many :maeils
  has_many :contacts
  has_many :receivers
  has_many :attachments
  has_many :friends, through: :contacts, source: :mailbox
  Max_email_count = 1
  # has_and_belongs_to_many :maeils
  before_create :mail_limit

  before_destroy :mails_in_inbox?

  delegate :inbox_mails, :spams, to: :maeils

  def mail_limit
    maeils.count < Max_email_count
  end

  def mails_in_inbox?
    self.inbox_mails.count >= 0
  end
end
