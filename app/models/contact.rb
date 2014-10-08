class Contact < ActiveRecord::Base
  belongs_to :mailbox
  # FIXME_AK: contact has_many :contacts?
  has_many :contacts
end
