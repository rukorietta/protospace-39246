class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true, length: { maximum: 200 }
  validates :occupation, presence: true, length: { maximum: 50 }
  validates :position, presence: true, length: { maximum: 50 }
  has_many :prototypes
  has_many :comments, dependent: :destroy
end
