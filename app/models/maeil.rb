class Maeil < ActiveRecord::Base
  belongs_to :mailbox
  has_many :attachments
  has_many :receivers, primary_key: "reply_id"
  has_many :replies, class_name: "Maeil", foreign_key: "maeil_id"
  belongs_to :maeil, class_name: "Maeil"

  # has_and_belongs_to_many :mailboxes
  delegate :audios, :texts, :videos, :zips, to: :attachments

end
