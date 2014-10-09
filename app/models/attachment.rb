class Attachment < ActiveRecord::Base
  # FIXED
  # FIXME_AK: naming issue.
  belongs_to :email
  # belongs_to :avatar, polymorphic: true

  scope :audio_attachments, -> { where(type: 'Audio') }
  scope :text_attachments, -> { where(type: 'Text') }
  scope :video_attachments, -> { where(type: 'Video') }
  scope :zip_attachments, -> { where(type: 'Zip') }

end
