fx_version 'cerulean'
games { 'rdr3', 'gta5' }

lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua',
    'editable_functions.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/css/*.css',
    'nui/js/*.js',
    'nui/fonts/*.woff',
    'nui/fonts/*.woff2',
}

escrow_ignore {
    'config.lua',
    'editable_functions.lua',
    'server.lua'
}