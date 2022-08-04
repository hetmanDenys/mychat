document.addEventListener("DOMContentLoaded", function(event) {
    const data_id = document.querySelector(".for_post");
    let user_id = data_id.dataset.id;
    const data_id_for_room = document.querySelector(".messages");
    let room_id = data_id_for_room.dataset.id;
    const current_data_id = document.querySelector(".name");
    let current_user_id = current_data_id.dataset.id;
    const url = '/message_create';

    let form = document.getElementById("message_form")
    form.addEventListener('submit', async evt => {
        evt.preventDefault()
        let formData = new FormData(form)
        let data_for_post = document.getElementById('input_message').value
        formData.append('body', data_for_post)
        formData.append('user_id', user_id)
        formData.append('current_user_id', current_user_id)
        formData.append('room_id', room_id)
        await postData(url, formData)
    });

    async function postData(url, formData) {
        const csrf = document.querySelector('meta[name="csrf-token"]').content;
        await fetch(url, {
            method: 'POST',
            mode: 'cors',
            credentials: 'same-origin',
            cache: 'no-cache',
            headers: {
                'X-CSRF-TOKEN': csrf,
                'Authorization': `Bearer ${gon.token}`
            },
            body: formData
        });
    }
});