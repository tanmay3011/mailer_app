class Contact < ActiveRecord::Base
  belongs_to :mailbox
  # FIXED
  # FIXME_AK: contact has_many :contacts?
  has_many :friends
end
