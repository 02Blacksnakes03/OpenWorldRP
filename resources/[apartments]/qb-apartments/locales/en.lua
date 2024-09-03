local Translations = {
    error = {
        to_far_from_door = 'Du bist zu weit weg von der Klingel',
        nobody_home = 'Es ist niemand zu Hause..',
        nobody_at_door = 'Es ist niemand an der Tür...'
    },
    success = {
        receive_apart = 'Du hast eine Wohnung bekommen',
        changed_apart = 'Du bist umgezogen',
    },
    info = {
        at_the_door = 'Jemand ist an der Tür!',
    },
    text = {
        options = '[E] Wohnungsoptionen',
        enter = 'Wohnung betreten',
        ring_doorbell = 'Klingel läuten',
        logout = 'Charakter ausloggen',
        change_outfit = 'Outfit wechseln',
        open_stash = 'Versteck öffnen',
        move_here = 'Hierher ziehen',
        open_door = 'Tür öffnen',
        leave = 'Wohnung verlassen',
        close_menu = '⬅ Menü schließen',
        tennants = 'Mieter',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
