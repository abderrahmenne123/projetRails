class Message < ApplicationRecord
    belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
    acts_as_notifier printable_name: :body
  def message_time
    created_at.strftime("%d/%m/%y at %H:%M:%S")
  end
end
