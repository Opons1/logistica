local itemstrings = logistica.itemstrings
local function L(s) return "logistica:"..s end
local SILV = L("silverin")
local SILV_SLICE = L("silverin_slice")

core.register_craft({
  output = SILV_SLICE.." 8",
  type = "shapeless",
  recipe = { SILV },
})

core.register_craft({
  output = SILV,
  type = "shapeless",
  recipe = {
    SILV_SLICE, SILV_SLICE, SILV_SLICE, SILV_SLICE,
    SILV_SLICE, SILV_SLICE, SILV_SLICE, SILV_SLICE
  },
})

core.register_craft({
  output = L("optic_cable 8"),
  recipe = {
    {L("silverin_plate")},
    {L("silverin_slice")},
    {L("silverin_plate")},
  }
})

core.register_craft({
  output = L("optic_cable_toggleable_off"),
  recipe = {
    {L("optic_cable"), itemstrings.fragment}
  }
})

core.register_craft({
  output = L("hyperspanner"),
  recipe = {
    {itemstrings.crystal},
    {L("silverin_circuit")},
    {itemstrings.steel},
  }
})

core.register_craft({
  output = L("photonizer"),
  recipe = {
    {itemstrings.fragment},
    {L("silverin_circuit")},
    {L("silverin_plate")},
  }
})

core.register_craft({
  output = L("photonizer"),
  type = "shapeless",
  recipe = { L("hyperspanner"), L("photonizer_reversed")},
  replacements = {{L("hyperspanner"), L("hyperspanner")}},
})

core.register_craft({
  output = L("photonizer_reversed"),
  type = "shapeless",
  recipe = { L("hyperspanner"), L("photonizer")},
  replacements = {{L("hyperspanner"), L("hyperspanner")}},
})

core.register_craft({
  output = L("standing_wave_box"),
  recipe = {
    {L("silverin_mirror_box")},
    {L("silverin_circuit")},
  }
})

core.register_craft({
  output = L("storage_upgrade_1"),
  recipe = {
    {L("silverin_slice"), L("standing_wave_box"), L("silverin_slice")},
    {L("silverin_slice"), "",                     L("silverin_slice")},
  }
})

core.register_craft({
  output = L("storage_upgrade_2"),
  recipe = {
    {"", itemstrings.diamond,               ""},
    {"", L("storage_upgrade_1"),  ""},
    {"", L("standing_wave_box"),  ""},
  }
})

if core.get_modpath("moreores") then
  core.register_craft({
    output = L("storage_upgrade_3"),
    recipe = {
      {"moreores:mithril_ingot", L("standing_wave_box"),  "moreores:mithril_ingot"},
      {"moreores:mithril_ingot", L("storage_upgrade_2"),  "moreores:mithril_ingot"},
      {"moreores:mithril_ingot", L("standing_wave_box"),  "moreores:mithril_ingot"},
    }
  })
  if core.get_modpath("technic_many_machines") then
    core.register_craft({
    output = L("storage_upgrade_4"),
    recipe = {
      {"technic_many_machines:radiant_alloy_ingot", L("standing_wave_box"), "technic_many_machines:radiant_alloy_ingot"},
      {L("storage_upgrade_3"), "default:mese_crystal",  L("storage_upgrade_3")},
      {"technic_many_machines:radiant_alloy_ingot", L("standing_wave_box"),  "technic_many_machines:radiant_alloy_ingot"},
    }
  })
  end
end

for filledBucket, _ in pairs(logistica.reservoir_get_full_buckets_for_liquid(logistica.liquids.lava)) do
  local emptyBucket = logistica.reservoir_get_empty_bucket_for_full_bucket(filledBucket)
  if core.registered_items[filledBucket] and core.registered_items[emptyBucket] then
    core.register_craft({
      output = filledBucket,
      type = "shapeless",
      recipe = { L("lava_unit"), emptyBucket }
    })
  end
end

core.register_craft({
  output = L("cobblegen_upgrade"),
  recipe = {
    {L("silverin_plate"), itemstrings.lava_bucket,  L("silverin_plate")},
    {"",                  itemstrings.water_bucket, itemstrings.cobgen_upgr_additional},
  },
  replacements = {
    {itemstrings.lava_bucket,  itemstrings.empty_bucket},
    {itemstrings.water_bucket, itemstrings.empty_bucket},
  }
})

core.register_craft({
  output = L("wireless_access_pad"),
  recipe = {
    {L("standing_wave_box"), itemstrings.diamond,             L("standing_wave_box")},
    {L("wireless_crystal"),  L("silverin_circuit"), L("wireless_crystal")},
    {L("silverin_slice"),    L("silverin_circuit"), L("silverin_slice")},
  }
})

core.register_craft({
  output = L("compression_tank 2"),
  recipe = {
    {"",                  L("silverin_plate"), ""},
    {L("silverin_plate"), "",                  L("silverin_plate")},
    {"",                  L("silverin_plate"), ""},
  }
})

core.register_craft({
  output = L("wireless_antenna 2"),
  recipe = {
    {"", L("silverin_plate"),   ""},
    {"", L("wireless_crystal"), ""},
    {"", L("silverin_circuit"), ""},
  }
})
