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

  validates :title, presence: true
  validates :cooking_method, presence: true, if: :requires_cooking_method?

  before_validation :clear_subcategory_other_title, unless: :subcategory_other?

  def subcategory_values_for_category
    case category.to_s
    when 'vegetable'
      %w[
        root_vegetable
        leaf_vegetable
        stem_vegetable
        fruit_vegetable
        other
      ]
    when 'meat'
      %w[
        beef
        pork
        chicken
        other
      ]
    when 'seafood'
      %w[
        fish
        shellfish
        other
      ]
    when 'drink'
      %w[
        water
        soft_drink
        tea
        coffee
        other
      ]
    else
      []
    end
  end

  def subcategory_other?
    subcategory == 'other'
  end

  def requires_cooking_method?
    category.in?(%w[meat seafood])
  end

  def checkable_sparkling?
    category == 'drink'
  end

  private

    def clear_subcategory_other_title
      self.subcategory_other_title = nil
    end
end
