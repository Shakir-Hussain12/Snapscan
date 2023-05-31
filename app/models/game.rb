class Game < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :game_categories
  has_many :categories, through: :game_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  after_save :update_count

  private

  def update_count
    user.update(games_count: user.games.count)
  end
end
