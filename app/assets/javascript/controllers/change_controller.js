import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const current_data_id = document.querySelector(".name");
        let current_user_id = current_data_id.dataset.id;

        if (current_user_id !== this.element.id){
            this.element.className = "alert alert-danger message shadow-md"
        }else {
            this.element.className = "alert alert-primary message shadow-md"
        }
    }
}
