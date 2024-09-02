fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'PSV'
version '1.0.1'

dependencies {
    "PolyZone",
}

shared_script { 
    'shared/config.lua',
    'shared/toys.lua',
    'shared/cards.lua',
}

client_script {
    'client/main.lua',
    'client/open.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/open.lua',
    'server/main.lua',
}

ui_page "html/index.html"

escrow_ignore{
	'shared/*',
	'html/*',
    '*.sql',
    '*.md',
    'client/*',
    'server/*',
    'imgs/*',
}

files {
    "html/*.*",
}
dependency '/assetpacks'