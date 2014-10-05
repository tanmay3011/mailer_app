class Contact < ActiveRecord::Base
  belongs_to :mailbox
  has_many :contacts
end
