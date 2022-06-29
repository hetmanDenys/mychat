import Handlebars from 'handlebars'

export default function createDomElements(data) {
    const data_id = document.querySelector(".for_post");
    let recipient_id = parseInt(data_id.dataset.id);
    console.log(data.current_user_id)
    console.log(recipient_id)
            const context = {
                dataBody: data.body,
                messages: data.messages.map(m => (
                    {
                      time: (data.created_at),
                      body: m.body,
                      sender_id: m.sender_id,
                      align: ( m.sender_id !== data.current_user_id) ? "your" : "my",
                    }
                )),
                    recipient_id: recipient_id,
                current_user_id: data.current_user_id
            };
    const template = Handlebars.compile(
        ` 
            <div class="our_messages" id="messages">
                {{#each messages}}
                        <div class='{{this.align}}'>
                            <div class="message" >
                                <p class="text color time">{{this.time}} </p>
                                <p class="text">{{this.body}}</p>
                            </div>
                        </div> 
                {{/each}}
            </div>
        `
        )
        document.querySelector('.messages').innerHTML = template(context)
}
