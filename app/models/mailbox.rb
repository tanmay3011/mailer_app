class Mailbox < ActiveRecord::Base
has_many :maeils
has_many :friends
has_many :receivers
has_many :contacts, :through => :friends
end
