import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = ["bigImage"]

  showImage(e) {
    if (!e.target.src) return
    this.bigImageTarget.src = e.target.src
  }
}
