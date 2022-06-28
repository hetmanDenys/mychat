document.addEventListener("DOMContentLoaded", function(event) {
    const data_id_fetch = document.querySelector(".for_fetch");
    let user_id_fetch = data_id_fetch.dataset.id;
    const current_data_id_fetch = document.querySelector(".name");
    let current_user_id_fetch = current_data_id_fetch.dataset.id;
    const url = '/user_create?user_id=' + user_id_fetch;

let send_form = document.getElementById("fetch_form")
send_form.addEventListener("submit", async evt => {
    evt.preventDefault();
    let data_for_fetch = document.getElementById('input_for_fetch').value
    await fetchData(url, data_for_fetch)
} );


async function fetchData(url, data){
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
        body: JSON.stringify({body: data, user_id: user_id_fetch, current_user_id: current_user_id_fetch})
    });
}
});