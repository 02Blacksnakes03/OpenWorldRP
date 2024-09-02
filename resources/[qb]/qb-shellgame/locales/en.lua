local Translations = {
    error = {
        nowin = 'Oh no, mejor suerte la próxima vez..',
placebet = 'Has hecho una apuesta de $%{value}..',
nomoney = '¡No tienes suficiente dinero para jugar!'
    },
    success = {
        win = '¡Ganaste!',
getreward = 'Ganaste x%{value} de tu dinero, así que $%{value2}'
    },
    info = {
        play = 'Jugar por $%{value}',
start = 'Comenzar a jugar',
choose = 'Elegir %{value}',
arrest = 'Poner en la cárcel',
howtoplay = '¡Elige uno de los 3 tazones y gana!'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
