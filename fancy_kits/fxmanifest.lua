fx_version "adamant"

game "gta5"

server_scripts {
    "server.lua",
    "config_sv.lua",
	'@mysql-async/lib/MySQL.lua'
}

client_scripts{
    "client.lua",
} 

shared_script '@es_extended/imports.lua'

ui_page {
	'ui/index.html'
}
files {
	'ui/index.html',
	'ui/js.js',
	'ui/style.css',
}