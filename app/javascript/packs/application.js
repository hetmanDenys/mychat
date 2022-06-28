import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import './websocket'
import '../channels/consumer'
import '../channels/my_channel'
import '../fetch/fetch'

// console.log(Handlebars)

Rails.start()
Turbolinks.start()
ActiveStorage.start()
