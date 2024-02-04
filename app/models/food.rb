class Food < ApplicationRecord
  CATEGORY_VALUES = %w[
    vegetable
    meat
    seafood
    drink
  ].freeze
  enum category: CATEGORY_VALUES.to_h { |v| [v, v] }

  SUBCATEGORY_VALUES = %w[
    root_vegetable
    leaf_vegetable
    stem_vegetable
    fruit_vegetable
    beef
    pork
    chicken
    fish
    shellfish
    water
    soft_drink
    tea
    coffee
    other
  ].freeze
  enum :subcategory, SUBCATEGORY_VALUES.to_h { |v| [v, v] }

  COOKING_METHOD_VALUES = %w[
    requires_cooking
    for_raw_consumption
  ].freeze
  enum cooking_method: COOKING_METHOD_VALUES.to_h { |v| [v, v] }

  validates :name, presence: true
end
