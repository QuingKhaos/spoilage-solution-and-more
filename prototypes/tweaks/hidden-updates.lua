local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

if settings.startup["spoilage-solution-and-more-tweaks-hide-canned"].value then
  --- @type data.ItemID[] List of all canned items.
  local canned_items = khaoslib_item.find(function(item)
    return item.name:match("^canned%-") ~= nil
  end)

  --- @type data.RecipeID[] List of all canning and uncanning recipes.
  local canned_recipes = khaoslib_recipe.find(function(recipe)
    return recipe.name:match("^conservate%-") ~= nil or recipe.name:match("^deconservate%-") ~= nil
  end)

  for _, item in pairs(canned_items) do
    khaoslib_item:load(item)
      :set {factoriopedia_alternative = "barrel"}
      :commit()
  end

  for _, recipe in pairs(canned_recipes) do
    khaoslib_recipe:load(recipe)
      :set {factoriopedia_alternative = "barrel", hide_from_player_crafting = true}
      :commit()
  end
end

if settings.startup["spoilage-solution-and-more-tweaks-hide-frozen"].value then
  --- @type data.ItemID[] List of all frozen items.
  local frozen_items = khaoslib_item.find(function(item)
    return item.name:match("^frozen%-") ~= nil
  end)

  --- @type data.RecipeID[] List of all freezing and unfreezing recipes.
  local frozen_recipes = khaoslib_recipe.find(function(recipe)
    return recipe.name:match("^freeze%-") ~= nil or recipe.name:match("^unfreeze%-") ~= nil
  end)

  for _, item in pairs(frozen_items) do
    khaoslib_item:load(item)
      :set {factoriopedia_alternative = "ice"}
      :commit()
  end

  for _, recipe in pairs(frozen_recipes) do
    khaoslib_recipe:load(recipe)
      :set {factoriopedia_alternative = "fluoroketone-cooling", hide_from_player_crafting = true}
      :commit()
  end
end
