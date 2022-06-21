import consumer from "./consumer"

// const lefter = document.getElementsByClassName("lefter")
// let user_id = lefter.dataset.id
document.addEventListener("DOMContentLoaded", function(event) {
    let data_for_post = document.getElementById('input_for_websocket').value

const myChannel = consumer.subscriptions.create({ channel: "MyChannel" }, {
    received(data) {
        console.log(data.body + "  ---------------------------------")
    }
})

    const data_id = document.querySelector(".for_post");
    let recipient_id = parseInt(data_id.dataset.id);
    let form_for_websocket = document.getElementById("websocket_form")
    form_for_websocket.addEventListener("submit", async evt => {
        evt.preventDefault();
        myChannel.send({ body: data_for_post, recipient_id: recipient_id })
    } );

});