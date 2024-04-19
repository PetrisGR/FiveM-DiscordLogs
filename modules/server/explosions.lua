-- Explosion Names (List Updated: 2024-04-19)
local explosionTags = { [0] = "GRENADE", [1] = "GRENADELAUNCHER", [2] = "STICKYBOMB", [3] = "MOLOTOV", [4] = "ROCKET", [5] = "TANKSHELL", [6] = "HI_OCTANE", [7] = "CAR", [8] = "PLANE", [9] = "PETROL_PUMP", [10] = "BIKE", [11] = "DIR_STEAM", [12] = "DIR_FLAME", [13] = "DIR_WATER_HYDRANT", [14] = "DIR_GAS_CANISTER", [15] = "BOAT", [16] = "SHIP_DESTROY", [17] = "TRUCK", [18] = "BULLET", [19] = "SMOKEGRENADELAUNCHER", [20] = "SMOKEGRENADE", [21] = "BZGAS", [22] = "FLARE", [23] = "GAS_CANISTER", [24] = "EXTINGUISHER", [25] = "_0x988620B8", [26] = "TRAIN", [27] = "BARREL", [28] = "PROPANE", [29] = "BLIMP", [30] = "DIR_FLAME_EXPLODE", [31] = "TANKER", [32] = "PLANE_ROCKET", [33] = "VEHICLE_BULLET", [34] = "GAS_TANK", [35] = "BIRD_CRAP", [36] = "RAILGUN", [37] = "BLIMP2", [38] = "FIREWORK", [39] = "SNOWBALL", [40] = "PROXMINE", [41] = "VALKYRIE_CANNON", [42] = "AIR_DEFENCE", [43] = "PIPEBOMB", [44] = "VEHICLEMINE", [45] = "EXPLOSIVEAMMO", [46] = "APCSHELL", [47] = "BOMB_CLUSTER", [48] = "BOMB_GAS", [49] = "BOMB_INCENDIARY", [50] = "BOMB_STANDARD", [51] = "TORPEDO", [52] = "TORPEDO_UNDERWATER", [53] = "BOMBUSHKA_CANNON", [54] = "BOMB_CLUSTER_SECONDARY", [55] = "HUNTER_BARRAGE", [56] = "HUNTER_CANNON", [57] = "ROGUE_CANNON", [58] = "MINE_UNDERWATER", [59] = "ORBITAL_CANNON", [60] = "BOMB_STANDARD_WIDE", [61] = "EXPLOSIVEAMMO_SHOTGUN", [62] = "OPPRESSOR2_CANNON", [63] = "MORTAR_KINETIC", [64] = "VEHICLEMINE_KINETIC", [65] = "VEHICLEMINE_EMP", [66] = "VEHICLEMINE_SPIKE", [67] = "VEHICLEMINE_SLICK", [68] = "VEHICLEMINE_TAR", [69] = "SCRIPT_DRONE", [70] = "RAYGUN", [71] = "BURIEDMINE", [72] = "SCRIPT_MISSILE", [73] = "RCTANK_ROCKET", [74] = "BOMB_WATER", [75] = "BOMB_WATER_SECONDARY", [76] = "_0xF728C4A9", [77] = "_0xBAEC056F", [78] = "FLASHGRENADE", [79] = "STUNGRENADE", [80] = "_0x763D3B3B", [81] = "SCRIPT_MISSILE_LARGE", [82] = "SUBMARINE_BIG", }

AddEventHandler("explosionEvent", function(source, explosion)
    local explosionName = explosionTags[tonumber(explosion.explosionType)] or "Unknown"

    exports[GetCurrentResourceName()]:CreateLog({
        category = "explosions",
        title = "Explosion Logs",
        action = "New",
        color = "red",
        players = {
            { id = source, role = "Source" },
        },
        info = {
            { name = "Explosion Type", value = explosionName },
            { name = "Damage Scale", value = "x"..explosion.damageScale },
            { name = "Camera Shake", value = "x"..explosion.cameraShake },
            { name = "Silent", value = not explosion.isAudible and "Yes" or "No"},
            { name = "Invisible", value = explosion.isInvisible and "Yes" or "No" },
        },
        takeScreenshot = true
    })
end)