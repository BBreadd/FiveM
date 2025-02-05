fx_version 'cerulean'
game 'gta5'

author 'SEDD'
description 'Crafting Script with Configurable Items'
version '1.0.0'

-- Client scripts
client_scripts {
    'config.lua',
    'client/main.lua',
    'client/menu.lua'
}

-- Server scripts
server_scripts {
    'config.lua',
    'server/main.lua'
}

-- Dependencies
dependencies {
    'qb-core',
    'qb-target',
    'qb-menu'
}
