class Mailbox < ActiveRecord::Base
  # FIXED
  # FIXME_AK: Do we need to preserve the maeils when mailbox is removed?
  has_many :sent_emails, class_name: Email
  has_many :received_emails, source: :email, through: :receivers

  has_many :emails, dependent: :destroy
  has_many :contacts
  has_many :receivers
  has_many :friends, through: :contacts
  #CONSTANT
  # FIXME_AK: What is the purpose of this variable?
  Max_email_count = 1
  validate :mail_limit, on: [:update, :create]

  # FIXED
  # FIXME_AK: Naming issue.
  before_destroy :normal_mails_not_present?
  after_update :update_log

  def inbox_mails
    self.emails.inbox_mails
  end

  def spams
    self.emails.spams
  end

  private
    def mail_limit
      emails.count < Max_email_count
    end

    def update_log
      logs << [" #{ firstname } has received a mail "]
    end

    def normal_mails_not_present?
      !(self.inbox_mails.count >= 0)
    end
end
