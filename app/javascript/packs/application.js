//= require turbolinks

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import * as mdb from 'mdb-ui-kit'
import './websocket'
import '../channels/consumer'
import '../channels/my_channel'
import '../fetch/fetch'
import '../channels/create_dom_elements'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
