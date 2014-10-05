class Maeil < ActiveRecord::Base
  has_many :attachments
  has_many :receivers, primary_key: 'reply_id'

  has_many :replies, class_name: 'Maeil', foreign_key: 'maeil_id'
  belongs_to :maeil, class_name: 'Maeil'

  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  belongs_to :sending_mailbox, class_name: 'Mailbox', foreign_key: :mailbox_id

  after_create :assign_email_type

  # has_and_belongs_to_many :mailboxes
  delegate :audios, :texts, :videos, :zips, to: :attachments

  scope :inbox_mails, -> { where(type: 'inbox') }
  scope :spams, -> { where(type: 'spam') }

  def assign_email_type
    if spam?
      self.type = 'spam'
    else
      self.type = 'inbox'
    end
  end

  def spam?
    self.texts.count > 0
  end
end
