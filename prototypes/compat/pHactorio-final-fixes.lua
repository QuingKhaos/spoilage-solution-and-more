local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if mods["pHactorio"] and settings.startup["spoilage-solution-and-more-compat-pHactorio"].value then
  -- Remove superflous frozen perishables.
  local to_remove = {
    "yumako",
    "jellynut",
    "biter-egg",
  }

  local freezing_tech = khaoslib_technology:load("freezing")

  for _, item_name in pairs(to_remove) do
    khaoslib_item.remove("frozen-" .. item_name)
    khaoslib_recipe.remove("freeze-" .. item_name)
    khaoslib_recipe.remove("unfreeze-" .. item_name)

    if mods["recycler"] then
      khaoslib_recipe.remove("frozen-" .. item_name .. "-recycling")
    end

    if mods["Flare Stack"] then
      khaoslib_recipe.remove("item-frozen-" .. item_name .. "-incineration")
    end

    freezing_tech:remove_unlock_recipe("freeze-" .. item_name)
    freezing_tech:remove_unlock_recipe("unfreeze-" .. item_name)
  end

  freezing_tech:commit()
end
