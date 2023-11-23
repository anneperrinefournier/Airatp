import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs";

// Connects to data-controller="travelers"
export default class extends Controller {
  static targets = ['numberOfTravelers'];

  connect() {
  }

  search() {
    const numberOfPassengers = this.numberOfTravelers

    Rails.ajax({
      type: "GET",
      url: `/vehicles/search_by_passengers?number_of_passengers=${numberOfPassengers}`,
      dataType: "json",
      success: (data) => {
        // Traitement des données retournées
        console.log(data);
      },
      error: (error) => {
        console.error(error);
      }
    });
  }
 }
