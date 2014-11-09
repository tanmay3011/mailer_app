class Attachment < ActiveRecord::Base
  # FIXED
  # FIXME_AK: naming issue.
  belongs_to :email

  scope :audios, -> { where(type: 'Audio') }
  scope :texts, -> { where(type: 'Text') }
  scope :videos, -> { where(type: 'Video') }
  scope :zips, -> { where(type: 'Zip') }

end
