import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="navbar-datepicker"
export default class extends Controller {
  connect() {
    console.log("coucou from navbar")
    const options = {
      minDate: "today",
      mode: "range",
      dateFormat: "d/m/Y h:iK",
    };


    this.fp = flatpickr(this.element, options);
  }
}
