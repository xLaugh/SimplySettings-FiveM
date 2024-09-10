Citizen.CreateThread(function()
    -- Gestion des éléments du HUD
    while true do
        Citizen.Wait(0)
        
        if not Config.HUD.displayRadar then
            HideHudComponentThisFrame(1) -- Désactive le radar
        end
        if Config.HUD.disableMoney then
            HideHudComponentThisFrame(3) -- Désactive l'affichage de l'argent
        end
        if Config.HUD.disableWeaponWheel then
            HideHudComponentThisFrame(19) -- Désactive la roue des armes
        end
        if Config.HUD.disableAmmoCount then
            HideHudComponentThisFrame(20) -- Désactive l'affichage des munitions
        end
        if Config.HUD.disableReticle then
            HideHudComponentThisFrame(14) -- Désactive le réticule (crosshair)
        end
        if Config.HUD.disableStreetName then
            HideHudComponentThisFrame(7) -- Désactive le nom des rues
        end
        if Config.HUD.disableAreaName then
            HideHudComponentThisFrame(9) -- Désactive le nom de la zone
        end
        if Config.HUD.disableVehicleName then
            HideHudComponentThisFrame(6) -- Désactive le nom du véhicule
        end
        if Config.HUD.disableHealthBar then
            HideHudComponentThisFrame(4) -- Désactive la barre de santé
        end
        if Config.HUD.disableArmorBar then
            HideHudComponentThisFrame(5) -- Désactive la barre d'armure
        end
        if Config.HUD.disableMinimapOutline then
            DisplayRadar(false)
        end
        if Config.HUD.disableVehicleInfo then
            HideHudComponentThisFrame(8) -- Désactive les informations du véhicule
        end
    end
end)

-- Gestion de la densité des PNJs et véhicules
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        SetVehicleDensityMultiplierThisFrame(Config.Density.vehicleDensity)
        SetPedDensityMultiplierThisFrame(Config.Density.pedDensity)
        SetRandomVehicleDensityMultiplierThisFrame(Config.Density.randomVehicleDensity)
        SetParkedVehicleDensityMultiplierThisFrame(Config.Density.parkedVehicleDensity)
        SetScenarioPedDensityMultiplierThisFrame(unpack(Config.Density.scenarioPedDensity))
    end
end)

-- Désactiver la possibilité de frapper avec R
if Config.Gameplay.disableMeleeAttack then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            DisableControlAction(0, 140, true) -- Désactive la frappe au poing avec R
        end
    end)
end

-- Désactiver les sons du dispatch de la police
if Config.Audio.disablePoliceDispatch then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            for i = 1, 12 do
                EnableDispatchService(i, false)
            end
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
            SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
        end
    end)
end

-- Activer ou désactiver les trains
if Config.Vehicles.enableTrains then
    Citizen.CreateThread(function()
        SwitchTrainTrack(0, true)
        SwitchTrainTrack(3, true)
        N_0x21973bbf8d17edfa(0, 120000)
        SetRandomTrains(true)
    end)
end

-- Désactiver les roulades
if Config.Gameplay.disableRolls then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            if IsControlPressed(0, 25) then
                DisableControlAction(0, 22, true) -- Désactive la roulade
            end
        end
    end)
end

-- Désactiver les sons ambiants
if Config.Audio.disableAmbientSounds then
    Citizen.CreateThread(function()
        StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
        SetAudioFlag("PoliceScannerDisabled", true)
    end)
end

-- Désactiver les coups de cross
if Config.Gameplay.disableWeaponMelee then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if IsPedArmed(ped, 6) then
                DisableControlAction(1, 140, true) -- Désactive le coup de cross
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end
        end
    end)
end

-- Désactiver la boussole du nord
if Config.HUD.disableNorthBlip then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetBlipAlpha(GetNorthRadarBlip(), 0) -- Désactive le nord sur la boussole
        end
    end)
end

-- Désactiver la caméra en mode inactif
if Config.World.disableIdleCamera then
    Citizen.CreateThread(function()
        while true do
            InvalidateIdleCam()
            InvalidateVehicleIdleCam()
            Wait(1000)
        end
    end)
end

-- Désactiver les récompenses de véhicules
if Config.Vehicles.disableVehicleRewards then
    Citizen.CreateThread(function()
        while true do
            DisablePlayerVehicleRewards(PlayerId())
            Wait(0)
        end
    end)
end

-- Désactiver les policiers à distance
if Config.World.disableDistantCops then
    Citizen.CreateThread(function()
        while true do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            ClearAreaOfCops(playerCoords.x, playerCoords.y, playerCoords.z, 400.0)
            Wait(1000)
        end
    end)
end

-- Désactiver le niveau de recherche
if Config.World.disableWantedLevel then
    Citizen.CreateThread(function()
        while true do
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
            Wait(0)
        end
    end)
end

-- Désactiver les tirs à la tête
if Config.Gameplay.disableHeadshots then
    SetPedSuffersCriticalHits(PlayerPedId(), false)
end

-- Activer le PvP
if Config.Gameplay.enablePvP then
    SetCanAttackFriendly(PlayerPedId(), true, false)
    NetworkSetFriendlyFireOption(true)
end

-- Désactiver le contrôle aérien
if Config.Gameplay.disableAirControl then
    SetAirControlMultiplier(0.0)
end

-- Gestion de la santé et de l'armure
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        
        -- Santé
        local health = GetEntityHealth(playerPed)
        if health < Config.Health.maxHealth then
            Wait(Config.Health.regenDelay)
            SetEntityHealth(playerPed, math.min(health + Config.Health.regenRate, Config.Health.maxHealth))
        end
        
        -- Armure
        local armor = GetPedArmour(playerPed)
        if armor < Config.Armor.maxArmor then
            Wait(Config.Armor.regenDelay)
            SetPedArmour(playerPed, math.min(armor + Config.Armor.regenRate, Config.Armor.maxArmor))
        end
    end
end)

-- Désactiver les dégâts des véhicules
if Config.Vehicles.disableVehicleDamage then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                SetVehicleCanBeVisiblyDamaged(vehicle, false)
                SetVehicleStrong(vehicle, true)
            end
        end
    end)
end

-- Désactiver les dégâts des piétons
if Config.World.disablePedDamage then
    SetPlayerInvincible(PlayerId(), true)
end

-- Désactiver le tremblement de l'écran lors d'explosions
if Config.Audio.disableExplosionShake then
    SetExplosionShakeScreenMagnitude(0.0)
end

-- Désactiver l'expulsion pour inactivité
if Config.Misc.disableIdleKick then
    SetPlayerInvincibleKeepRagdollEnabled(PlayerId(), true)
end

-- Désactiver le ramassage d'armes
if Config.Gameplay.disableWeaponPickups then
    RemoveAllPickupsOfType(0xDF711959) -- Munitions
    RemoveAllPickupsOfType(0xF9AFB48F) -- Armes
end

-- Désactiver les cris ambiants
if Config.Audio.disableAmbientCries then
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
end

-- Désactiver tous les services de dispatch
if Config.World.disableDispatchServices then
    for i = 1, 15 do
        EnableDispatchService(i, false)
    end
end

-- Activer l'invincibilité du joueur
if Config.Misc.enableInvincibility then
    SetPlayerInvincible(PlayerId(), true)
end

-- Désactiver le recul des armes
if Config.Gameplay.disableWeaponRecoil then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsPedShooting(PlayerPedId()) then
                local _, weapon = GetCurrentPedWeapon(PlayerPedId())
                SetWeaponRecoilShakeAmplitude(weapon, 0.0)
            end
        end
    end)
end

-- Désactiver le démarrage automatique du moteur
if Config.Vehicles.disableVehicleEngineStart then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if IsPedGettingIntoAVehicle(ped) then
                local vehicle = GetVehiclePedIsTryingToEnter(ped)
                SetVehicleEngineOn(vehicle, false, true, true)
            end
        end
    end)
end

-- Désactiver les alarmes de véhicules
if Config.Vehicles.disableVehicleAlarms then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if IsPedTryingToEnterALockedVehicle(ped) then
                local vehicle = GetVehiclePedIsTryingToEnter(ped)
                SetVehicleAlarm(vehicle, false)
            end
        end
    end)
end

-- Désactiver l'apparition de PNJ
if Config.World.disablePedSpawning then
    SetPedPopulationBudget(0)
end

-- Désactiver l'apparition de véhicules
if Config.World.disableVehicleSpawning then
    SetVehiclePopulationBudget(0)
end

-- Désactiver la synchronisation météo
if Config.World.disableWeatherSync then
    SetWeatherTypeNow("CLEAR")
    SetWeatherTypePersist("CLEAR")
end

-- Désactiver la synchronisation du temps
if Config.World.disableTimeSync then
    NetworkOverrideClockTime(12, 0, 0)
end

-- Activer la nuit permanente
if Config.World.enablePermanentNighttime then
    NetworkOverrideClockTime(0, 0, 0)
end

-- Désactiver la physique de l'eau
if Config.World.disableWaterPhysics then
    SetWavesIntensity(0.0)
end

-- Désactiver les phares cassés des véhicules
if Config.Vehicles.disableVehicleBrokenLights then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                SetVehicleLights(vehicle, 0)
                SetVehicleBurnout(vehicle, false)
                SetVehicleEngineHealth(vehicle, 1000.0)
            end
        end
    end)
end
