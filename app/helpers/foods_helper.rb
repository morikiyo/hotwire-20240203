module FoodsHelper
  def food_category_options
    Food::categories.values.map { |v| [I18n.t("activerecord.attributes.food.categories.#{v}"), v] }
  end

  def food_subcategory_options
    Food::subcategories.values.map { |v| [I18n.t("activerecord.attributes.food.subcategories.#{v}"), v] }
  end

  def food_cooking_method_options
    Food::cooking_methods.values.map { |v| [I18n.t("activerecord.attributes.food.cooking_methods.#{v}"), v] }
  end
end
