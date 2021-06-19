class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :avatar
  has_one :jobprofile
  has_many :demandes
  has_many :comments
  # acts_as_notifiable :users, targets: User.all
  def full_name
 "#{firstname} #{lastname}"
          
 end
  paginates_per 4
  validates :role, presence: true
  def self.search(search)
    if search
      where(["firstname LIKE ?","%#{search}%"])
    else
      all
    end

  end

end
