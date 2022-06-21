import consumer from "./consumer"

document.addEventListener("DOMContentLoaded", function(event) {

    const myChannel = consumer.subscriptions.create({ channel: "MyChannel" }, {
        received(data) {
            const data_id = document.querySelector(".for_post");
            let recipient_id = parseInt(data_id.dataset.id);
            const messages = document.getElementById("messages")
            let my_tag_time, my_tag_text, my_time, my_text, my_first_block, my_second_block;
            let your_tag_time, your_tag_text, your_time, your_text, your_first_block, your_second_block;

            if (recipient_id !== data.current_user_id){
                my_tag_text = document.createElement("p");
                my_tag_time = document.createElement("p");
                my_tag_text.classList.add('text');
                my_tag_time.classList.add('text');
                my_tag_time.classList.add('color');
                my_tag_time.classList.add('time');
                my_text = document.createTextNode(data.body);
                my_time = document.createTextNode(data.created_at);
                my_tag_time.appendChild(my_time);
                my_tag_text.appendChild(my_text);
                my_first_block = document.createElement("div");
                my_first_block.classList.add('message');
                my_first_block.classList.add('righter');
                my_first_block.appendChild(my_tag_time);
                my_first_block.appendChild(my_tag_text);
                my_second_block = document.createElement("div");
                my_second_block.classList.add('my');
                my_second_block.appendChild(my_first_block);
                messages.appendChild(my_second_block);
            }else if(recipient_id === data.current_user_id){
                your_tag_text = document.createElement("p");
                your_tag_time = document.createElement("p");
                your_tag_time.classList.add('text');
                your_tag_time.classList.add('color');
                your_tag_time.classList.add('time');
                your_tag_text.classList.add('text');
                your_time = document.createTextNode(data.created_at);
                your_text = document.createTextNode(data.body);
                your_tag_time.appendChild(your_time);
                your_tag_text.appendChild(your_text);
                your_first_block = document.createElement("div");
                your_first_block.classList.add('message');
                your_first_block.classList.add('lefter');
                your_first_block.classList.add('cf');
                your_first_block.appendChild(your_tag_time);
                your_first_block.appendChild(your_tag_text);
                your_second_block = document.createElement("div");
                your_second_block.classList.add('your');
                your_second_block.classList.add('lefter');
                your_second_block.appendChild(your_first_block);
                messages.appendChild(your_second_block);
            }
        }
    })
    myChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })
});

