import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


export default class extends Controller {


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


      const event = new CustomEvent("datepicker:dates-selected", {
        detail: { daysDifference },
      });

      window.dispatchEvent(event);
    }
  }

  calculateDaysDifference(startDate, endDate) {
    const timeDifference = endDate.getTime() - startDate.getTime();
    return Math.ceil(timeDifference / (1000 * 3600 * 24));
  }
}
