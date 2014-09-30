class Mailbox < ActiveRecord::Base
has_many :maeils
has_many :friends
has_many :receivers
has_many :attachments
has_many :contacts, :through => :friends

# has_and_belongs_to_many :maeils
end
