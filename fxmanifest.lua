fx_version 'cerulean'

game 'gta5'

author 'qw-scripts'
description ''
version '1.0.0'

lua54 'yes'

shared_scripts {
    'shared/config.lua',
    '@ox_lib/init.lua'
}

client_scripts { 'client/*.lua' }

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'html/index.html'

files { 'html/index.html', 'html/js/index.js', 'html/assets/index.css', 'locales/*.json' }
