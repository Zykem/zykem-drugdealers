-- Generated automaticly by RB Generator.
fx_version('adamant')
games({ 'gta5' })

shared_script('');

server_scripts({

    '@oxmysql/lib/MySQL.lua',
    'server.lua',

});

client_scripts({

    'config.lua',
    'client.lua'

});

ui_page('menu/ui.html')

files({

    'menu/ui.html',
    'menu/style.css',
    'menu/script.js'

})