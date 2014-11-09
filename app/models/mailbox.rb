class Mailbox < ActiveRecord::Base
  # FIXED
  # FIXME_AK: Do we need to preserve the maeils when mailbox is removed?
  has_many :sent_emails, class_name: Email
  has_many :received_emails, source: :email, through: :receivers

  has_many :inbox_emails, class_name: Reciever
  has_many :received_emails, through: :inbox_emails, source: :email
  has_many :contacts, dependent: :destroy
  has_many :receivers
  has_many :friends, through: :contacts
  has_one :log
  #CONSTANT
  # FIXME_AK: What is the purpose of this variable?

  # FIXED
  # FIXME_AK: Naming issue.
  before_destroy :normal_mails_not_present?
  after_create :create_log

  def inbox_mails
    inbox_emails.normal_mails
  end

  def spams
    inbox_emails.spams
  end

  private
    def normal_mails_not_present?
      !(inbox_mails.count > 0)
    end

    def create_log
      log.create
    end
end
