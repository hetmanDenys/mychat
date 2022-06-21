
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import './websocket'
import '../channels/consumer'
import '../channels/my_channel'
import '../channels/create_dom_elements'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
