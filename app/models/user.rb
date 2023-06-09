class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :games, dependent: :destroy

  if Rails.env.test? || Rails.env.development?
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  else
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  end

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
end
