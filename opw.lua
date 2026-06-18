local S = logistica.TRANSLATOR
local function L(s) return "logistica:"..s end

logistica.craftitem.storage_upgrade = {}
local items = logistica.craftitem.storage_upgrade

items["logistica:storage_upgrade_1"] = {
  description = S("Silverin Storage Upgrade\nAdds 512 Mass Storage Slot Capacity"),
  storage_upgrade = 512,
  inventory_image = "logistica_storage_upgrade_1.png",
  stack_max = logistica.stack_max,
}

items["logistica:storage_upgrade_2"]= {
  description = S("Diamond Storage Upgrade\nAdds 1024 Mass Storage Slot Capacity"),
  storage_upgrade = 1024,
  inventory_image = "logistica_storage_upgrade_2.png",
  stack_max = logistica.stack_max,
}

items["logistica:storage_upgrade_3"]= {
  description = S("Mithril Storage Upgrade\nAdds 2048 Mass Storage Slot Capacity"),
  storage_upgrade = 2048,
  inventory_image = "logistica_storage_upgrade_3.png",
  stack_max = logistica.stack_max,
}

items["logistica:storage_upgrade_4"]= {
  description = S("Storage Upgrade Array\nAdds 4096 Mass Storage Slot Capacity"),
  storage_upgrade = 4096,
  inventory_image = "logistica_storage_upgrade_4.png",
  stack_max = logistica.stack_max,
}

items["logistica:storage_upgrade_multiplier"] = {
  description = S("Mass Storage Capacity Multiplier\nMultiplies Mass Storage Slot Capacity by 5\nOnly 1 can be inserted per Mass Storage"),
  storage_multiplier = 5,
  inventory_image = "logistica_storage_upgrade_multiplier.png",
  stack_max = logistica.stack_max,
}

for name, info in pairs(items) do
  minetest.register_craftitem(name, {
    description = info.description,
    inventory_image = info.inventory_image,
    stack_max = info.stack_max,
  })
end
core.clear_craft({output = "logistica:storage_upgrade_multiplier"})

logistica.register_supplier(S("Passive Supplier Chest"), "passive_supplier", 32, {
      "logistica_passive_supplier_top.png",
      "logistica_passive_supplier_bottom.png",
      "logistica_passive_supplier_side.png^[transformFX",
      "logistica_passive_supplier_side.png",
      "logistica_passive_supplier_side.png",
      "logistica_passive_supplier_front.png",
})

if core.get_modpath("moreores") then
logistica.register_supplier(S("Passive Supplier Chest 2"), "passive_supplier2", 48, {
    "logistica_passive_supplier_top_2.png",
    "logistica_passive_supplier_bottom_2.png",
    "logistica_passive_supplier_side_2.png",
    "logistica_passive_supplier_side_2.png",
    "logistica_passive_supplier_side_2.png",
    "logistica_passive_supplier_front_2.png",
})
core.register_craft({
  output = "logistica:passive_supplier2",
  recipe = {
    {"moreores:mithril_ingot", "moreores:mithril_ingot", "moreores:mithril_ingot"},
    {"moreores:mithril_ingot", "logistica:passive_supplier", "moreores:mithril_ingot"},
    {"moreores:mithril_ingot", "moreores:mithril_ingot", "moreores:mithril_ingot"},
  }
})
end


core.register_craft({
  output = L("storage_upgrade_3"),
  recipe = {
    {"moreores:mithril_ingot", L("standing_wave_box"),  "moreores:mithril_ingot"},
    {"moreores:mithril_ingot", L("storage_upgrade_2"),  "moreores:mithril_ingot"},
    {"moreores:mithril_ingot", L("standing_wave_box"),  "moreores:mithril_ingot"},
  }
})

core.register_craft({
  output = L("storage_upgrade_4"),
  recipe = {
    {"technic_many_machines:radiant_alloy_ingot", L("standing_wave_box"), "technic_many_machines:radiant_alloy_ingot"},
    {L("storage_upgrade_3"), "default:mese_crystal",  L("storage_upgrade_3")},
    {"technic_many_machines:radiant_alloy_ingot", L("standing_wave_box"),  "technic_many_machines:radiant_alloy_ingot"},
  }
})

core.register_craft({
  output = "logistica:storage_upgrade_multiplier",
  recipe = {
    {"nyancat:nyancat_rainbow", "legendary_ore:legendary_ore", "nyancat:nyancat_rainbow"},
    {"nyancat:nyancat_rainbow", "logistica:storage_upgrade_3", "nyancat:nyancat_rainbow"},
    {"nyancat:nyancat_rainbow", "legendary_ore:legendary_ore", "nyancat:nyancat_rainbow"},
  }
})