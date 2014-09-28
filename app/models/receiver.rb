class Receiver < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :maeil
end
