class Mailbox < ActiveRecord::Base
  # FIXED
  # FIXME_AK: Do we need to preserve the maeils when mailbox is removed?
  has_many :emails, dependent: :destroy
  has_many :contacts
  has_many :receivers
  has_many :attachments
  has_many :friends, through: :contacts, source: :mailbox
  # FIXME_AK: What is the purpose of this variable?
  Max_email_count = 1
  # has_and_belongs_to_many :emails
  before_create :mail_limit

  # FIXED
  # FIXME_AK: Naming issue.
  before_destroy :normal_mails_present?

  delegate :inbox_mails, :spams, to: :emails

  def mail_limit
    emails.count < Max_email_count
  end

  def normal_mails_present?
    self.inbox_mails.count >= 0
  end
end
