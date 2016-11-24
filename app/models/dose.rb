class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: true
  validates :ingredient, presence: true, uniqueness: true
  validates :ingredient, uniqueness: { scope: :cocktail,
    message: "should be unique" }
end
