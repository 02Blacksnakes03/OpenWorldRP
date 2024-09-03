--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments
--->https://discord.gg/undergrounddevelopments

fx_version 'bodacious'

version '0.0.0'

games { 'gta5' }

lua54 "yes"


ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'html/*mp3',
  'html/*wav',
  'html/*ttf',
  'images/*.png',
  'images/*.jpg',
  'images/*.webp',
  'images/*.mp4',
  'images/*.svg',
  'fonts/*.ttf',
  'fonts/*.otf',
  'stream/*.yft',
  'stream/*.ycd',
  'stream/*.ytyp',
  'stream/*.ydr',
}

client_scripts{
    'client/*.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/*.lua',
}

shared_scripts {
	'shared/cores.lua',
  'shared/config.lua'
}

escrow_ignore {
	'shared/cores.lua',
  'shared/config.lua',
  'stream/*.yft',
  'stream/*.ycd',
  'stream/*.ytyp',
  'stream/*.ydr',
  'client/*.lua',
  'server/*.lua',
}


data_file 'DLC_ITYP_REQUEST' 'stream/ch_prop_ch_arcade_drones.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ch_prop_ch_casino_drones.ytyp'


dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'