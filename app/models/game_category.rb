class GameCategory < ApplicationRecord
  belongs_to :game, foreign_key: 'game_id'
  belongs_to :category, foreign_key: 'category_id'
end
