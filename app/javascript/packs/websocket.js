
document.addEventListener("DOMContentLoaded", function(event) {
const data_id = document.querySelector(".for_post");
let user_id = data_id.dataset.id;
const current_data_id = document.querySelector(".name");
let current_user_id = current_data_id.dataset.id;
const url = '/message_create';

let send_form = document.getElementById("message_form")
send_form.addEventListener("submit", async evt => {
    evt.preventDefault();
    let data_for_post = document.getElementById('input_message').value
    await postData(url, data_for_post)
} );


async function postData(url, data){
    const csrf = document.querySelector('meta[name="csrf-token"]').content;
    await fetch(url, {
        method: 'POST',
        mode: 'cors',
        credentials: 'same-origin',
        cache: 'no-cache',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': csrf,
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1Nn0.bJvurScFSUTs_j_vTaUqiAdAUa1vVXl3g8WZIa7fTOY'
        },
        body: JSON.stringify({body: data, user_id: user_id, current_user_id: current_user_id})
    });
}
});