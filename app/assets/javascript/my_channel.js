import consumer from "consumer"


const myChannel = consumer.subscriptions.create({ channel: "MyChannel" }, {
    received(data) {
    }
})

    const data_id = document.querySelector(".for_websocket");
    const current_id = document.querySelector(".name");
    let recipient_id = parseInt(data_id.dataset.id);
    let current_user_id = parseInt(current_id.dataset.id);
    let form_for_websocket = document.getElementById("websocket_form")
    form_for_websocket.addEventListener("submit", async evt => {
        evt.preventDefault();
        let data_for_websocket = document.getElementById('input_for_websocket').value
        myChannel.send({ body: data_for_websocket, recipient_id: recipient_id, current_user_id: current_user_id})
    } );

