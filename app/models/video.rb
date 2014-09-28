class Video < Attachment
  scope :videos, -> { where(type: 'Video') }
end
