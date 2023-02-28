Config = {}

Config.SteamApi = '' -- ur steam api key must be same on server.cfg
Config.Item = 'markedbills' -- Black Money Item

Config.Locations = {
      {
      type = 2, -- marker type / https://docs.fivem.net/docs/game-references/markers/
      name = "MR BEAST", -- Maker name must be unique
      coord = vector3(18.82, -1111.97, 29.8), --  coord
      job = 'police', --  select who can access menu 
      jobstatus = false, -- if it enabled fee goes management account (qb-management)
      fee = 30, -- %30  totalfee = 1000 / 100 * 30 = 300 
      MarkerColor = {
          R = 220, -- Marker Color (R)
          G = 220,   -- Marker Color (G)
          B = 220,   -- Marker Color (B)
          A = 70,  -- Marker Color (A)
      },
      MarkerSize = {
          X = 0.3,  -- Marker Size (X)
          Y = 0.3,  -- Marker Size (Y)
          Z = 0.3,  -- Marker Size (Z)
      },
      TrayLocations = {
        vector3(20.3, -1106.12, 29.8),
        vector3(22.1, -1106.71, 29.8),
      },
      DutyLocations = {
        vector3(12.55, -1105.84, 29.8)
      },
      BossLocations = {
        vector3(14.62, -1103.04, 29.8)
      },
      Prop = {
        Text = '[E] - Wash Money',
        table_model = 'prop_washer_03',
        coords = vector3(7, -1097.45, 28.8),  
        rotation = vector3(0.0, 0.0, 70.0),
      }
  },
  -- u can duplicate and make multiple location
--   {
--     type = 2, -- marker type / https://docs.fivem.net/docs/game-references/markers/
--     name = "Washing5", -- Maker name must be unique
--     coord = vector3(18.82, -1111.97, 29.8), --  coord
--     job = 'police', --  if all everyone can access
--     jobstatus = false, -- if it enabled fee goes management account (qb-management)
--     fee = 30, -- %30  totalfee = 1000 / 100 * 30 = 300 
--     MarkerColor = {
--         R = 220, -- Marker Color (R)
--         G = 220,   -- Marker Color (G)
--         B = 220,   -- Marker Color (B)
--         A = 70,  -- Marker Color (A)
--     },
--     MarkerSize = {
--         X = 0.3,  -- Marker Size (X)
--         Y = 0.3,  -- Marker Size (Y)
--         Z = 0.3,  -- Marker Size (Z)
--     },
--     TrayLocations = {
--       vector3(20.3, -1106.12, 29.8),
--       vector3(22.1, -1106.71, 29.8),
--     },
--     DutyLocations = {
--       vector3(12.55, -1105.84, 29.8)
--     },
--     BossLocations = {
--       vector3(12.55, -1105.84, 29.8)
--     },
--     Prop = {
--       Text = '[E] - Wash Money',
--       table_model = 'prop_washer_03',
--       coords = vector3(14.65, -1122.67, 28.79),
--       rotation = vector3(0.0, 0.0, 70.0),
--     }
-- },

}
