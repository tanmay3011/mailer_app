class Attachment < ActiveRecord::Base
  has_and_belongs_to_many :maeils
end