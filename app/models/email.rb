# FIXME_AK: Naming issue.
class Email < ActiveRecord::Base
  has_many :attachments
  has_many :receivers, primary_key: 'reply_id'

  # FIXME_AK: do we need the foreign_key option here?
  has_many :replies, class_name: 'Email', foreign_key: 'email_id'
  belongs_to :email, class_name: 'Email'

  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  # FIXME_AK: No need for single quotes in class_name.
  belongs_to :sending_mailbox, class_name: 'Mailbox', foreign_key: :mailbox_id

  before_save :assign_email_type

  # has_and_belongs_to_many :mailboxes
  delegate :audios, :texts, :videos, :zips, to: :attachments

  scope :inbox_mails, -> { where(type: 'normal') }
  scope :spams, -> { where(type: 'spam') }

  # FIXED
  # FIXME_AK: Can we reduce the DB hit if I do this in before_save?
  # FIXME_AK: refactor this method.
  def assign_email_type
    if spam?
      assign('spam')
    else
      assign('normal')
    end
  end

  def assign(type)
    self.type = type
  end

  # FIXED
  # FIXME_AK: texts is not good name.
  def spam?
    self.text_attacment.count > 0
  end
end
