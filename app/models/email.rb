#FIXED
# FIXME_AK: Naming issue.
class Email < ActiveRecord::Base

  TYPE = { spam: 'spam', normal: 'normal' }

  has_many :receivers, dependent: :destroy
  #FIXED
  # FIXME_AK: do we need the foreign_key option here?
  has_many :replies, class_name: Email
  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  has_many :attachments, dependent: :destroy do
    def filenames
      pluck(:filename)
    end
  end
  #FIXED
  # FIXME_AK: No need for single quotes in class_name.
  belongs_to :parent_email, class_name: Email, foreign_key: :email_id
  belongs_to :sending_mailbox, class_name: Mailbox, foreign_key: :mailbox_id

  before_validation :set_subject, if: -> { subject.blank? }
  before_save :assign_email_type, :add_sender_to_receivers_contact, :recipient_limit_reached
  after_save :add_log_entry

  validates :priority, range: { greater_than: 0, less_than: 5 }, if: -> { priority? }

  scope :normal_mails, -> { where(type: TYPE[:normal]) }
  scope :spams, -> { where(type: TYPE[:spam]) }

  def audios
    attachments.audios
  end

  def texts
    attachments.texts
  end

  def videos
    attachments.videos
  end

  def zips
    attachments.zips
  end
  # FIXED
  # FIXME_AK: Can we reduce the DB hit if I do this in before_save?
  # FIXME_AK: refactor this method.
  private
    def set_subject
      self.subject = 'Subject'
    end

    def assign_email_type
      spam? assign(TYPE[:spam]) : assign(TYPE[:normal])
    end

    def assign(type)
      self.type = type
    end

    # FIXME_AK: texts is not good name.
    def spam?
      texts.count > 0
    end

    def add_sender_to_receivers_contact
      mailbox.contacts.try(:create, receivers)
    end

    def recipient_limit_reached
      if recieving_mailboxes.size > 10
        errors.add :base, 'max reciepients limit reached'
      end
    end

    def add_log_entry
      receiving_mailboxes.each do |receiving_mailbox|
        sending_mailbox.log.entries.create(description: "Mail sent to receiving_mailbox.email")
        receiving_mailbox.log.entries.create(description: " Mail received from sending_mailbox.email")
      end
    end
end
