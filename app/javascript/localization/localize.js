document.addEventListener("DOMContentLoaded", function(event) {
    const url = '/?locale=';

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
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMH0.46frU1AjZSzpt5vX-I9LR6iWQ7jYZzTB8W_TAZkm1qU'
            },
            body: JSON.stringify({body: data, user_id: user_id, current_user_id: current_user_id})
        });
    }
});