local Translations = {
    store = {
        barber = "Friseursalon",
        surgeon = "Plastischer Chirurg",
        clothing = "Bekleidungsgeschäft",
        outfitchanger = "Outfit-Wechsler"
    },

    outfits = {
        roomOutfits = "Voreinstellungen",
        myOutfits = "Meine Outfits",
        character = "Kleidung",
        accessoires = "Accessoires"
    },

    menu = {
        hair = "Haar",
        character = "Kleidung",
        accessoires = "Accessoires",
        features = "Funktionen"
    },

    ui = {
        select = "Auswählen",
        delete = "Löschen",
        select_outfit = "Outfit auswählen",
        player_model = "Spielermodell",
        model = "Modell",
        mother = "Mutter",
        father = "Vater",
        texture = "Textur",
        type = "Typ",
        item = "Artikel",
        skin_color = "Hautfarbe",
        parent_mixer = "Eltern-Mixer",
        shape_mix = "Formmischung",
        skin_mix = "Hautmischung",
        arms = "Arme",
        undershirt = "Unterhemd/Gürtel",
        color = "Farbe",
        jacket = "Jacken/Oben",
        vests = "Westen",
        decals = "Aufkleber",
        acessory = "Hals-Accessoires",
        bags = "Taschen",
        pants = "Hosen",
        shoes = "Schuhe",
        eye_color = "Augenfarbe",
        moles = "Muttermale/Sommersprossen",
        opacity = "Opazität",
        nose_width = "Nasenbreite",
        width = "Breite",
        nose_peak_height = "Nasenhöhenpunkt-Höhe",
        height = "Höhe",
        nose_peak_length = "Nasenhöhenpunkt-Länge",
        length = "Länge",
        nose_bone_height = "Nasenbein-Höhe",
        nose_peak_lowering = "Nasenhöhenpunkt-Senkung",
        lowering = "Senkung",
        nose_bone_twist = "Nasenbein-Drehung",
        twist = "Drehung",
        eyebrow_height = "Augenbrauenhöhe",
        eyebrow_depth = "Augenbrauen-Tiefe",
        depth = "Tiefe",
        cheeks_height = "Wangenhöhe",
        cheeks_width = "Wangenbreite",
        cheeks_depth = "Wangentiefe",
        eyes_opening = "Augenöffnung",
        opening = "Öffnung",
        lips_thickness = "Lippendicke",
        thickness = "Dicke",
        jaw_bone_width = "Kieferbeinhöhe",
        jaw_bone_length = "Kieferbein-Länge",
        chin_height = "Kinnbeinhöhe",
        chin_width = "Kinnbeinhöhe",
        butt_chin = "Kinnspalte",
        size = "Größe",
        neck_thickness = "Halsdicke",
        ageing = "Alterung",
        hair = "Haar",
        eyebrow = "Augenbrauen",
        facial_hair = "Gesichtsbehaarung",
        lipstick = "Lippenstift",
        blush = "Rouge",
        makeup = "Make-up",
        mask = "Masken",
        hat = "Hüte",
        glasses = "Brillen",
        ear_accessories = "Ohrenaccessoires",
        watch = "Uhren",
        bracelet = "Armbänder",
        btn_confirm = "Bestätigen",
        btn_cancel = "Abbrechen",
        btn_saveOutfit = "Outfit speichern",
        outfit_name = "Outfit-Name"
    },

    notify = {
        error_bracelet = "Du kannst dein Fußkettchen nicht entfernen ...",
        info_deleteOutfit = "Du hast dein %{outfit} Outfit gelöscht!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
