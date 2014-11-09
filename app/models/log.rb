class Log < ActiveRecord::Base
  has_many :entries
  belongs_to :mailbox
  after_create :add_welcome_message

  private
    def add_welcome_message
      entries.create(description: "Welcome #{ mailbox.firstname }")
    end
end
