class Friend < ActiveRecord::Base
  belongs_to :contact
  belongs_to :mailbox

  before_create :set_firstname_if_not_given

  validates :mailbox_id, uniqueness: { scope: :contact_id }

  private
    def set_firstname_if_not_given
      self.firstname = contact.firstname
    end
end
