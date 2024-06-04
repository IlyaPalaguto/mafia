import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="option-fields"
export default class extends Controller {
  static targets = ['optionFields']

  connect() {
  }

  toggle() {
    this.optionFieldsTarget.classList.toggle("hidden")
  }
}
