
document.addEventListener("DOMContentLoaded", function(event) {
const data_id = document.querySelector(".for_post");
let user_id = data_id.dataset.id;
const current_data_id = document.querySelector(".name");
let current_user_id = current_data_id.dataset.id;
const url = '/message_create';
// const image_upload = document.getElementById('pictures');
// const results = document.getElementsByClassName('messages');

let form = document.getElementById("message_form")
form.addEventListener('submit', async evt => {
    evt.preventDefault()
    let formData = new FormData(form)
    let data_for_post = document.getElementById('input_message').value
    formData.append('body', data_for_post)
    formData.append('current_user_id', current_user_id)
    await postData(url, formData)
} );


async function postData(url, formData){
    const csrf = document.querySelector('meta[name="csrf-token"]').content;
    await fetch(url, {
        method: 'POST',
        mode: 'cors',
        credentials: 'same-origin',
        cache: 'no-cache',
        headers: {
            // 'Content-Type': 'multipart/form-data',
            'X-CSRF-TOKEN': csrf,
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMH0.46frU1AjZSzpt5vX-I9LR6iWQ7jYZzTB8W_TAZkm1qU'
        },
        body: formData
    });
}
});

        // JSON.stringify({body: data, user_id: user_id, current_user_id: current_user_id, file: formData})