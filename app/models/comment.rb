class Comment < ApplicationRecord
  belongs_to :jobprofile
  belongs_to :client, foreign_key: :user_id, class_name: "User"

  paginates_per 4
  def comments_time
    created_at.strftime("%d/%m/%y at %H:%M:%S")
  end
end
