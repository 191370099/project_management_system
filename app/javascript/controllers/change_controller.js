import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change"
export default class extends Controller {
  static targets = ["ticket"]
  static values = {
    name: String
  }
  connect() {
    if( this.nameValue == "Developer"){
      this.ticketTarget.a.textContent = "View Tickets";
    }
  }
}
