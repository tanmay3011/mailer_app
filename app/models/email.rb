#FIXED
# FIXME_AK: Naming issue.
class Email < ActiveRecord::Base
  has_many :attachments
  has_many :receivers, primary_key: :reply_id
  #FIXED
  # FIXME_AK: do we need the foreign_key option here?
  has_many :replies, class_name: Email
  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  #FIXED
  # FIXME_AK: No need for single quotes in class_name.
  belongs_to :parent_email, class_name: Email, foreign_key: :email_id
  belongs_to :sending_mailbox, class_name: Mailbox, foreign_key: :mailbox_id

  before_save :assign_email_type
  before_create :set_subject, unless: -> { subject.present? }

  validates :subject, presence: true

  scope :inbox_mails, -> { where(type: 'normal') }
  scope :spams, -> { where(type: 'spam') }

  def audios
    self.attachments.audios
  end

  def texts
    self.attachments texts
  end

  def videos
    self.attachments.videos
  end

  def zips
    self.attachments.zips
  end
  # FIXED
  # FIXME_AK: Can we reduce the DB hit if I do this in before_save?
  # FIXME_AK: refactor this method.
  private
    def set_subject
      self.subject = 'Subject'
    end

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
