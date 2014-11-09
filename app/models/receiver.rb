class Receiver < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :email, counter_cache: true

end
