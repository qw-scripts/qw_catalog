Config = {}

Config.Interaction = {
    coords = vector4(131.15013122559, -3007.2495117188, 7.0408930778503, 3.0149056911469),
    prop = "nf_tablet_6str"
}

Config.VehicleSpawn = vector4(978.71942138672, -3002.0090332031, -40.192642211914, 90.059883117676)

Config.Camera = {
    start = vector3(975.22723388672, -3004.4968261719, -39.253955841064),
    point = vector3(978.71942138672, -3002.0090332031, -40.192642211914),
}

Config.Vehicles = {
    {
        model = 'dominator7', -- VEHICLE MODEL NAME
        inStock = true,       -- IS THE VEHICLE IN STOCK, IF NOT IT WONT SHOW IN THE CATALOG
        class = 'S',          -- NEED TO GET AN EXPORT FROM CLASSIC FOR THIS
        props = {}            -- VEHICLE PROPS, IF YOU WANT TO ADD ANY
    },
    {
        model = 'euros',
        inStock = true,
        class = 'S',
        props = {
            color1 = 27,
            modSpoilers = 2,
            neonEnabled = { true, true, true, true },
            neonColor = { 255, 0, 0 },
        }
    },
    {
        model = 'remus',
        inStock = true,
        class = 'A+',
        props = {}
    },
    {
        model = 'comet6',
        inStock = true,
        class = 'S',
        props = {}
    },
    {
        model = 'growler',
        inStock = true,
        class = 'B',
        props = {}
    },
    {
        model = 'elegy',
        inStock = true,
        class = 'S',
        props = {}
    },
    {
        model = 'elegy2',
        inStock = true,
        class = 'B',
        props = {}
    }
}

QBCore = exports['qb-core']:GetCoreObject()
