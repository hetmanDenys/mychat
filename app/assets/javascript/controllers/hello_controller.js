import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const current_data_id = document.querySelector(".name");
    let current_user_id = current_data_id.dataset.id;
    const color_messages = document.getElementById("dataset_current_user_id");

      if (current_user_id !== this.element.id){
        this.element.className = "your"
      }else {
        this.element.className = "my"
      }
  }
}
