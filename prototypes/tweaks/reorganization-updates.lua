local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_item_subgroup = require("__khaoslib__.prototypes.item-subgroup")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

--- @type data.ItemID[] List of all canned items.
local canned_items = khaoslib_item.find(function(item)
  return item.name:match("^canned%-") ~= nil
end)

--- @type data.RecipeID[] List of all canning and uncanning recipes.
local canned_recipes = khaoslib_recipe.find(function(recipe)
  return recipe.name:match("^conservate%-") ~= nil or recipe.name:match("^deconservate%-") ~= nil
end)

--- @type data.RecipeID[] List of all freezing and unfreezing recipes.
local frozen_recipes = khaoslib_recipe.find(function(recipe)
  return recipe.name:match("^freeze%-") ~= nil or recipe.name:match("^unfreeze%-") ~= nil
end)

if mods["bioprocessing-tab"] then
  khaoslib_item_subgroup:load {
    type = "item-subgroup",
    name = "spoilage-solution",
    group = "bioprocessing",
    order = "h[spoilage-solution]"
  } :commit()

  for _, recipe in pairs(frozen_recipes) do
    khaoslib_recipe:load(recipe)
      :set {subgroup = "spoilage-solution"}
      :commit()
  end

  khaoslib_recipe:load("produce_canning_fluid")
    :set {subgroup = "spoilage-solution"}
    :commit()
end

if mods["barreling-group2"] then
  for _, item in pairs(canned_items) do
    khaoslib_item:load(item)
      :set {subgroup = "barreling"}
      :commit()
  end

  for _, recipe in pairs(canned_recipes) do
    khaoslib_recipe:load(recipe)
      :set {subgroup = "barreling"}
      :commit()
  end
elseif mods["bioprocessing-tab"] then
  for _, item in pairs(canned_items) do
    khaoslib_item:load(item)
      :set {subgroup = "spoilage-solution"}
      :commit()
  end

  for _, recipe in pairs(canned_recipes) do
    khaoslib_recipe:load(recipe)
      :set {subgroup = "spoilage-solution"}
      :commit()
  end
end
