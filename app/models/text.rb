class Text < Attachment
  scope :texts, -> { where(type: 'Text') } 
end