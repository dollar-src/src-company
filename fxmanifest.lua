fx_version 'bodacious'
games { 'gta5' }

client_script "client.lua"


server_script "server.lua"
ui_page {
	'html/index.html',
}

shared_script {
	'shared.lua'
}
files {
	'html/css/*.woff',
	'html/css/*.woff2',
	'html/css/*.ttf',
	'html/css/*.css',
	'html/js/*.js',
	'html/index.html',
	"html/css/*.ttf",
	"html/fontawesome/css/*.css",
	"html/fontawesome/css/*.ttf",
	'html/img/index.html',
    'html/img/*.png'}


	-- prop part taken from // https://github.com/swkeep/keep-crafting thx
	-- steam profile api from ak4y thx