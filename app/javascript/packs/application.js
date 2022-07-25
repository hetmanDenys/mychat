//= require jquery-3.2.1.slim.min
//= require popper.min
//= require bootstrap.min
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import './websocket'
import '../channels/consumer'
import '../channels/my_channel'
import './datepicker'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
