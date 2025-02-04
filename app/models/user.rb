class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :full_name, presence: true

  validates :phone_number, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts , dependent: :destroy
  has_many :comments , dependent: :destroy

  has_one :profile, dependent: :destroy
  after_create :create_profile


  private

  def create_profile
    Profile.create(user: self, full_name: self.full_name)
  end
end
