import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change"
export default class extends Controller {
  static targets = ["ticket"]
  static values = {
    name: String
  }
  connect() {
    console.log("Hello it's Salman");
    if( this.nameValue == "Developer"){
      this.ticketTarget.textContent = "View Tickets";
    }
  }
}
