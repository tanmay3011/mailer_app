# FIXME_AK: Naming issue.
class Maeil < ActiveRecord::Base
  has_many :attachments
  has_many :receivers, primary_key: 'reply_id'

  # FIXME_AK: do we need the foreign_key option here?
  has_many :replies, class_name: 'Maeil', foreign_key: 'maeil_id'
  belongs_to :maeil, class_name: 'Maeil'

  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  # FIXME_AK: No need for single quotes in class_name.
  belongs_to :sending_mailbox, class_name: 'Mailbox', foreign_key: :mailbox_id

  after_create :assign_email_type

  # has_and_belongs_to_many :mailboxes
  delegate :audios, :texts, :videos, :zips, to: :attachments

  scope :inbox_mails, -> { where(type: 'inbox') }
  scope :spams, -> { where(type: 'spam') }

  # FIXME_AK: Can we reduce the DB hit if I do this in before_save?
  # FIXME_AK: refactor this method.
  def assign_email_type
    if spam?
      self.type = 'spam'
    else
      self.type = 'inbox'
    end
  end

  # FIXME_AK: texts is not good name.
  def spam?
    self.texts.count > 0
  end
end