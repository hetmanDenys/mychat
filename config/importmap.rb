# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'websocket', preload: true
pin 'consumer', preload: true
pin 'my_channel', preload: true
pin 'create_dom_elements', preload: true
pin 'bootstrap', preload: true
pin '@popperjs/core', to: '@popperjs--core.js', preload: true
pin 'mdb-ui-kit', preload: true
pin 'jquery', preload: true
pin 'turbolinks', preload: true
pin '@rails/activestorage', to: '@rails--activestorage.js', preload: true
pin '@rails/ujs', to: '@rails--ujs.js', preload: true
pin '@rails/actioncable', to: '@rails--actioncable.js', preload: true
pin_all_from 'app/assets/javascript/controllers', under: 'controllers'
pin '@hotwired/turbo-rails', to: '@hotwired--turbo-rails.js'
pin '@hotwired/turbo', to: '@hotwired--turbo.js'
pin '@rails/actioncable/src', to: '@rails--actioncable--src.js'
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.1.0/dist/stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin '@tailwindcss/forms', to: 'https://ga.jspm.io/npm:@tailwindcss/forms@0.5.2/src/index.js'
pin 'mini-svg-data-uri', to: 'https://ga.jspm.io/npm:mini-svg-data-uri@1.4.4/index.js'
pin 'picocolors', to: 'https://ga.jspm.io/npm:picocolors@1.0.0/picocolors.browser.js'
pin 'tailwindcss/colors', to: 'https://ga.jspm.io/npm:tailwindcss@3.1.8/colors.js'
pin 'tailwindcss/defaultTheme', to: 'https://ga.jspm.io/npm:tailwindcss@3.1.8/defaultTheme.js'
pin 'tailwindcss/plugin', to: 'https://ga.jspm.io/npm:tailwindcss@3.1.8/plugin.js'
pin 'flowbite', to: 'https://ga.jspm.io/npm:flowbite@1.5.2/dist/flowbite.js'
