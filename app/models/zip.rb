class Zip < Attachment
  scope :zips, -> { where(type: 'Zip') }
end