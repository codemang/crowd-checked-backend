class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments

  before_validation :attach_api_token

  validates_presence_of :api_token, on: [:create]

  private

  def attach_api_token
    self.api_token = SecureRandom.uuid
  end
end
