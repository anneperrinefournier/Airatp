import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


export default class extends Controller {


  static target = {
    totalPrice: "String",
  }

  connect() {
    const options = {
      minDate: "today",
      mode: "range",
      onChange: this.handleChange.bind(this),
    };

    this.fp = flatpickr(this.element, options);
  }

  handleChange(selectedDates, dateStr, instance) {
    if (selectedDates.length >= 2) {
      const startDate = selectedDates[0];
      const endDate = selectedDates[selectedDates.length - 1];
      const daysDifference = this.calculateDaysDifference(startDate, endDate);

      // Update the placeholder with the number of days
      const displayElement = document.getElementById("number_of_days_display");
      if (displayElement) {
        displayElement.textContent = daysDifference;
      }

      // Update the hidden field with the number of days (optional)
      const hiddenField = document.getElementById("number_of_days_hidden");
      if (hiddenField) {
        hiddenField.value = daysDifference;
      }
      console.log(daysDifference)

      const price = document.querySelector(".price-per-day")
      console.log(price.textContent)

      const result = Number(price.textContent) * daysDifference
      console.log(result)

      this.totalPriceTarget.innerText = `Total price = ${result}`
      this.totalPriceTarget.dataset.result = result;
    }
  }

  calculateDaysDifference(startDate, endDate) {
    // Implement your logic to calculate the difference in days
    const timeDifference = endDate.getTime() - startDate.getTime();
    return Math.ceil(timeDifference / (1000 * 3600 * 24));
  }
}
