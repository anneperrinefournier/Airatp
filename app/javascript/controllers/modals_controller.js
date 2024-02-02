import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    console.log("Modal controller connected!");
  }

  openModal(event) {
    const modalId = event.currentTarget.dataset.id;
    const modal = this.modalTargets.find(modal => modal.dataset.id === modalId);

    if (modal) {
      modal.style.display = "block";
    }
  }

  closeModal(event) {
    const modalId = event.currentTarget.dataset.id;
    const modal = this.modalTargets.find(modal => modal.dataset.id === modalId);

    if (modal) {
      modal.style.display = "none";
    }
  }
}
