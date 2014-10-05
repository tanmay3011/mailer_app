class Attachment < ActiveRecord::Base
  belongs_to :maeil
  # belongs_to :avatar, polymorphic: true

  scope :audios, -> { where(type: 'Audio') }
  scope :texts, -> { where(type: 'Text') }
  scope :videos, -> { where(type: 'Video') }
  scope :zips, -> { where(type: 'Zip') }

end
