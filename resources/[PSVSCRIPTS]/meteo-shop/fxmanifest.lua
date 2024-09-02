fx_version 'bodacious'

version '0.0.0'
games { 'gta5' }
author 'https://discord.gg/uKaRkaQEeb'
description 'This script is specifically modified for the PSV server.'

ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'images/*.png',
  'images/*.jpg',
  'images/*.webp',
  'images/*.mp4',
  'fonts/*.ttf',
  'fonts/*.otf'
 
}

shared_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'config.lua'
}

client_scripts{
    'client/client.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/server.lua',
}

escrow_ignore {
  'config.lua',
  'client/client.lua',
  'server/server.lua',
}

lua54 "yes"
