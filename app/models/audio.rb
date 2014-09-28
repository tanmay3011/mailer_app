class Audio < Attachment
  scope :audios, -> { where(type: 'Audio') }
end