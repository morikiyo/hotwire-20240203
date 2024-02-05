import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="food-category-form"
export default class extends Controller {
  static targets = ['category', 'subcategory']
  static values = { path: String }

  connect() {
    this.categoryForm = document.getElementById('food-category-form')
  }

  replaceCategoryForm(_event) {
    if (!this.categoryForm) return

    const categoryValue = this.categoryTarget.selectedOptions[0].value
    const subcategoryValue = this.subcategoryTarget.selectedOptions[0].value

    const searchParams = new URLSearchParams()
    searchParams.append(this.categoryTarget.name, categoryValue)
    searchParams.append(this.subcategoryTarget.name, subcategoryValue)

    const queryPath = `${this.pathValue}?${searchParams.toString()}`
    this.categoryForm.src = queryPath
  }
}
