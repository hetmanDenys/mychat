
document.addEventListener("DOMContentLoaded", function(event) {
const data_id = document.querySelector(".for_post");
let data_set = data_id.dataset.id;
const url = '/user_create?user_id=' + data_set;

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
            'X-CSRF-TOKEN': csrf
        },
        body: JSON.stringify({body: data,})
    });
}
});