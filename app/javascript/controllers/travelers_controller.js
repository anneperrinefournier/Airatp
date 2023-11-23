import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs";

// Connects to data-controller="travelers"
export default class extends Controller {
  static targets = ['numberOfTravelers'];

  connect() {
  }
 }
