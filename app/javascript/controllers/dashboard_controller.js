import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ['yourBookingsSelect', 'ownVehiclesSelect', 'pendingSelect', 'confirmedSelect', 'yourBookingsInfo', 'ownVehiclesInfo', 'pendingInfo', 'confirmedInfo'];

  connect() {
    console.log("Hello from Dashboard controller");
  }

  tabSelect(event) {
    console.log(event.target.dataset.clicked)

    event.preventDefault()

    this.yourBookingsInfoTarget.classList.add('d-none')
    this.yourBookingsSelectTarget.classList.remove('active')
    this.ownVehiclesInfoTarget.classList.add('d-none')
    this.ownVehiclesSelectTarget.classList.remove('active')
    this.pendingInfoTarget.classList.add('d-none')
    this.pendingSelectTarget.classList.remove('active')
    this.confirmedInfoTarget.classList.add('d-none')
    this.confirmedSelectTarget.classList.remove('active')

    if (event.target.dataset.clicked == 'yourBookings') {
      this.yourBookingsInfoTarget.classList.remove('d-none')
    } else if (event.target.dataset.clicked == 'ownVehicles') {
      this.ownVehiclesInfoTarget.classList.remove('d-none')
    } else if (event.target.dataset.clicked == 'pending') {
      this.pendingInfoTarget.classList.remove('d-none')
    } else if (event.target.dataset.clicked == 'confirmed') {
      this.confirmedInfoTarget.classList.remove('d-none')
    }
    event.target.classList.add('active')
  }

  validateBooking(event) {
    event.preventDefault()

    
  }
}
