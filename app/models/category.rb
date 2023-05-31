class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :game_categories
  has_many :games, through: :game_categories

  validates :name, presence: true
  validates :icon, presence: true

  after_save :update_count

  private

  def update_count
    user.update(categories_count: user.categories.count)
  end
end
