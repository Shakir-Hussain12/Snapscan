class User < ApplicationRecord
  has_many :categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: { minimun: 5, maximum: 50 }
end
