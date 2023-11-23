import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["total"];
  static values = { days: Number }

  connect() {
    window.addEventListener("datepicker:dates-selected", (event) => {
      const { daysDifference } = event.detail;

      this.daysValue = daysDifference;


      this.calculateTotal();
    });
  }

  calculateTotal() {
    const day = this.daysValue;
    const price = document.querySelector(".price-per-day").innerHTML;
    const total_price = day * price;

    this.totalTarget.textContent = `${day}x${price}=${total_price}€`;
  }
}
