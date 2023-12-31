import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-status"
export default class extends Controller {
  static targets = ['status', 'buttons'];

  connect() {
  }

  update(event) {
    event.preventDefault();

    const url = event.currentTarget.href

    fetch(url, {
      method: 'PATCH',
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
        accept: "application/json"
      }
    })
    .then(response => response.json())
    .then(data => {
      this.statusTarget.innerText = data.status;
      if (data.status == "Validated") {
        this.statusTarget.classList.add("text-success");
        this.statusTarget.classList.remove("text-secondary");
        this.statusTarget.classList.remove("text-danger");
        this.buttonsTarget.remove()
      } else if (data.status == "Refused") {
        this.statusTarget.classList.add("text-danger")
        this.statusTarget.classList.remove("text-secondary");
        this.statusTarget.classList.remove("text-success");
        this.buttonsTarget.remove()
      } else {
        this.statusTarget.classList.add("text-secondary");
        this.statusTarget.classList.remove("text-success");
        this.statusTarget.classList.remove("text-danger");
      }
    })

  }
}
