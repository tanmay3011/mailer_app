class Maeil < ActiveRecord::Base
  belongs_to :mailbox
  has_and_belongs_to_many :attachments
  has_many :receivers, primary_key: "reply_id"
  has_many :replies, class_name: "Maeil", foreign_key: "reply_id"
  belongs_to :maeil, class_name: "Maeil"
end
