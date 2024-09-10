Config = {}

-- Interface utilisateur (HUD)
Config.HUD = {
    displayRadar = true,        -- Affiche ou masque le radar
    disableMoney = true,        -- Désactive l'affichage de l'argent
    disableWeaponWheel = true,  -- Désactive la roue de sélection d'armes
    disableAmmoCount = true,    -- Masque le compteur de munitions
    disableReticle = true,      -- Supprime le réticule de visée
    disableStreetName = true,   -- Masque le nom des rues
    disableAreaName = true,     -- Masque le nom des zones/quartiers
    disableVehicleName = true,  -- Masque le nom du véhicule actuel
    disableHealthBar = true,    -- Masque la barre de santé
    disableArmorBar = true,     -- Masque la barre d'armure
    disableMinimapOutline = true, -- Supprime le contour de la minimap
    disableVehicleInfo = true,  -- Masque les informations du véhicule (vitesse, carburant, etc.)
    disableNorthBlip = true     -- Supprime l'indicateur du nord sur la minimap
}

-- Densité du monde
Config.Density = {
    vehicleDensity = 0.03,      -- Réduit la densité des véhicules en circulation
    pedDensity = 0.5,           -- Réduit la densité des piétons
    randomVehicleDensity = 0.04, -- Réduit l'apparition aléatoire de véhicules
    parkedVehicleDensity = 0.25, -- Réduit le nombre de véhicules stationnés
    scenarioPedDensity = {0.15, 0.15} -- Réduit la densité des PNJ dans les scénarios
}

-- Contrôles et gameplay
Config.Gameplay = {
    disableMeleeAttack = true,  -- Désactive l'attaque au corps à corps
    disableRolls = true,        -- Empêche le joueur de faire des roulades
    disableWeaponMelee = true,  -- Désactive les attaques au corps à corps avec les armes
    disableHeadshots = false,   -- Désactive les tirs à la tête (false = activé)
    enablePvP = true,           -- Active le mode PvP
    disableAirControl = false,  -- Désactive le contrôle en l'air (false = contrôle normal)
    disableWeaponRecoil = false, -- Supprime le recul des armes (false = recul normal)
    disableWeaponPickups = true -- Empêche le ramassage d'armes au sol
}

-- Véhicules
Config.Vehicles = {
    disableVehicleDamage = false, -- Rend les véhicules invincibles (false = dommages normaux)
    disableVehicleRewards = true, -- Désactive les récompenses pour l'entrée dans les véhicules
    disableVehicleAlarms = true,  -- Désactive les alarmes des véhicules
    disableVehicleEngineStart = false, -- Empêche le démarrage automatique des moteurs
    disableVehicleBrokenLights = true, -- Empêche les phares de se casser
    enableTrains = true          -- Active ou désactive les trains
}

-- Sons et effets
Config.Audio = {
    disablePoliceDispatch = true, -- Désactive les appels radio de la police
    disableAmbientSounds = true,  -- Supprime les sons ambiants
    disableAmbientCries = true,   -- Supprime les cris ambiants
    disableExplosionShake = true  -- Désactive le tremblement de l'écran lors des explosions
}

-- Santé et armure
Config.Health = {
    maxHealth = 200,  -- Définit la santé maximale du joueur
    regenRate = 1,    -- Taux de régénération de la santé par seconde
    regenDelay = 5000 -- Délai avant le début de la régénération (en ms)
}

Config.Armor = {
    maxArmor = 100,   -- Définit l'armure maximale du joueur
    regenRate = 0.5,  -- Taux de régénération de l'armure par seconde
    regenDelay = 10000 -- Délai avant le début de la régénération de l'armure (en ms)
}

-- Monde et environnement
Config.World = {
    disablePedDamage = false,    -- Rend les PNJ invincibles (false = dommages normaux)
    disableIdleCamera = true,    -- Désactive la caméra en mode inactif
    disableDistantCops = true,   -- Supprime les policiers à distance
    disableWantedLevel = true,   -- Désactive le système de recherche
    disableDispatchServices = true, -- Désactive tous les services d'urgence
    disablePedSpawning = false,  -- Empêche l'apparition de nouveaux PNJ
    disableVehicleSpawning = false, -- Empêche l'apparition de nouveaux véhicules
    disableWeatherSync = false,  -- Désactive la synchronisation météo
    disableTimeSync = false,     -- Désactive la synchronisation de l'heure
    enablePermanentNighttime = false, -- Force une nuit permanente
    disableWaterPhysics = false  -- Désactive la physique de l'eau
}

-- Autres paramètres
Config.Misc = {
    disableIdleKick = true,      -- Empêche l'expulsion pour inactivité
    enableInvincibility = false  -- Rend le joueur invincible
}