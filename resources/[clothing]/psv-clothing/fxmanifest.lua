fx_version "cerulean"

lua54 'yes'

games { "gta5" }

author 'ANTUNES'

description "PSV CLOTHING"

version "1.1.0"

ui_page 'web/dist/index.html'

files {
    "web/dist/**/*",
}

client_scripts {
    "@psv-lib/client/cl_rpcs.js",
    "@psv-lib/client/cl_rpc.lua",
    "shared/config.js",
    "client/cl_client.lua"
}

server_scripts {
    "@psv-lib/server/sv_rpcs.js",
    "@psv-lib/server/sv_rpcs.lua",
    "@psv-lib/server/sv_sql.js",
    "@psv-lib/server/sv_sql.lua",
}

shared_script "shared/config.js"

client_scripts { "client/cl_*.js" , "client/cl_*.lua" }

server_scripts { "server/sv_*.js" , "server/sv_*.lua"}

escrow_ignore {
    "client/cl_openclient.lua"
}
