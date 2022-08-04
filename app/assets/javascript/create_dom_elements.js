
export default function createDomElements(data) {
    const data_id = document.querySelector(".for_post");
    let recipient_id = parseInt(data_id.dataset.id);
            const context = {
                dataBody: data.body,
                messages: data.messages.map(m => (
                    {
                      time: (data.created_at),
                      body: m.body,
                      file: m.file,
                      user_id: m.user_id,
                      align: ( m.user_id !== data.current_user_id) ? "your" : "my",
                    }
                )),
                    recipient_id: recipient_id,
                current_user_id: data.current_user_id
            };
    const template = Handlebars.compile(
        ` 
            <div class="our_messages scroll_messages" id="messages">
<!--                <div class="s">-->
                    {{#each messages}}
                            <div class='{{this.align}}'>
                                {{#if this.file}}
                                    <div id="for_file_downloading">
                                        <a href="/files/{{this.file}}" class="link link-info" download="{{this.file}}">{{this.file}}</a>
                                    </div>
                                {{/if}}
                                <div class="alert alert-primary message" >
                                    <p class="text color time">{{this.time}} </p>
                                    <p class="text content">{{this.body}}</p>
                                </div>
                            </div> 
                    {{/each}}
<!--                </div>-->
            </div>
        `
        )
        document.querySelector('.messages').innerHTML = template(context)
}
