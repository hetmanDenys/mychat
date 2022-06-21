import consumer from "./consumer"

// const lefter = document.getElementsByClassName("lefter")
// let user_id = lefter.dataset.id
document.addEventListener("DOMContentLoaded", function(event) {
    let data_for_post = document.getElementById('input_for_websocket').value

const myChannel = consumer.subscriptions.create({ channel: "MyChannel" }, {
    received(data) {
        console.log(data.body + "---------------------------------")
    }
})

myChannel.send({ data_for_post })
});