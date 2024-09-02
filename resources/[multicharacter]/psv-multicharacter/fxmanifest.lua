fx_version 'cerulean'
game 'gta5'

description 'psv-multicharacter'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}
client_script 'client/main.lua'
server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    '@qb-apartments/config.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/image/*.png',
    'html/image/*.gif',
    "html/js/*",
    'html/index.html',
    'html/css/*',
}

dependencies {
    'qb-core'
}
