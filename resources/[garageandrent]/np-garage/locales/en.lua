local Translations = {
    error = {
        no_vehicles = 'Es sind keine Fahrzeuge an diesem Ort vorhanden!',
        not_depot = 'Ihr Fahrzeug befindet sich nicht im Depot',
        not_owned = 'Dieses Fahrzeug kann nicht gespeichert werden',
        not_correct_type = 'Sie können diesen Fahrzeugtyp hier nicht speichern',
        not_enough = 'Nicht genug Geld',
        no_garage = 'Keine',
        vehicle_occupied = 'Sie können dieses Fahrzeug nicht speichern, da es nicht leer ist',
        vehicle_not_tracked = 'Fahrzeug konnte nicht verfolgt werden',
        no_spawn = 'Bereich zu überfüllt'
    },
    success = {
        vehicle_parked = 'Fahrzeug gespeichert',
        vehicle_tracked = 'Fahrzeug verfolgt',
    },
    status = {
        out = 'Außen',
        garaged = 'In Garage',
        impound = 'Von der Polizei eingezogen',
        house = 'Haus',
    },
    info = {
        car_e = 'Garage',
        sea_e = 'Bootshaus',
        air_e = 'Hangar',
        rig_e = 'Bohrplatz',
        depot_e = 'Depot',
        house_garage = 'Hausgarage',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
 