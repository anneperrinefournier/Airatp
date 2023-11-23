import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-modal"
export default class extends Controller {
  static targets = ["modal"];

  connect() {
    // You can add additional setup logic here
    const modal = new bootstrap.Modal(this.modalTarget);
    modal.show();
  }
}
