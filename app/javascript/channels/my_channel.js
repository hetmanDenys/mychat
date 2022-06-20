import consumer from "./consumer"

// const lefter = document.getElementsByClassName("lefter")
// let user_id = lefter.dataset.id

const myChannel = consumer.subscriptions.create({ channel: "MyChannel" }, {
    received(data) {
        console.log(data)
    }
})

myChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })
