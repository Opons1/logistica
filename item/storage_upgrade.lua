local S = logistica.TRANSLATOR

logistica.craftitem.storage_upgrade = {}
local items = logistica.craftitem.storage_upgrade

items["logistica:leaves_upgrade"] = {
  description = S("Leaves Upgrade\nInsert into a Wood Supplier to also harvest leaves"),
  inventory_image = "logistica_leaves_upgrade.png",
  stack_max = 1,
}

items["logistica:sprinkler_upgrade"] = {
  description = S("Sprinkler Upgrade\nInsert into a Farming Supplier to enable water-assisted growth"),
  inventory_image = "logistica_sprinkler_upgrade.png",
  stack_max = 1,
}

items["logistica:autocrafting_upgrade"] = {
  description = S("Access Point Crafting Upgrade\nInsert into an Access Point to enable autocrafting"),
  inventory_image = "logistica_autocrafting_upgrade.png",
  stack_max = 1,
}

items["logistica:autocrafting_recursive_upgrade"] = {
  description = S("Recursive Crafting Upgrade\nInsert into an Access Point to enable autocrafting and recursive crafting"),
  inventory_image = "logistica_autocrafting_recursive_upgrade.png",
  stack_max = 1,
}

--------------------------------
-- registration
--------------------------------

for name, info in pairs(items) do
  minetest.register_craftitem(name, {
    description = info.description,
    inventory_image = info.inventory_image,
    stack_max = info.stack_max,
  })
end
