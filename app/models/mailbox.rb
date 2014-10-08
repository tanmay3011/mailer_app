class Mailbox < ActiveRecord::Base
  # FIXME_AK: Do we need to preserve the maeils when mailbox is removed?
  has_many :maeils
  has_many :contacts
  has_many :receivers
  has_many :attachments
  has_many :friends, through: :contacts, source: :mailbox
  # FIXME_AK: What is the purpose of this variable?
  Max_email_count = 1
  # has_and_belongs_to_many :maeils
  before_create :mail_limit

  # FIXME_AK: Naming issue.
  before_destroy :mails_in_inbox?

  delegate :inbox_mails, :spams, to: :maeils

  def mail_limit
    maeils.count < Max_email_count
  end

  def mails_in_inbox?
    self.inbox_mails.count >= 0
  end
end
