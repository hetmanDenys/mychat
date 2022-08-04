import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
// import * as mdb from 'mdb-ui-kit'
import 'websocket'
import '@hotwired/turbo-rails'
import 'consumer'
import 'my_channel'

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
