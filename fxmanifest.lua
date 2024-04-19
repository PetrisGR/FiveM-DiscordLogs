fx_version 'cerulean'
game 'gta5'

author 'Petris <https://github.com/PetrisGR>'
description 'Discord Logs'
version '1.0.0'

lua54 'yes'

shared_script('@ox_lib/init.lua')

client_scripts {
    'screenshot.lua',
    'modules/client/*.lua',
}

server_scripts {
    'config.lua',
    'main.lua',
    'modules/server/*.lua'
}

dependencies {
    'ox_lib',
    'screenshot-basic'
}