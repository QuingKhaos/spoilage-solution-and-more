local khaoslib_item = require("__khaoslib__.prototypes.item")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")

if mods["fulgora-coralmium-agriculture"] and settings.startup["spoilage-solution-and-more-compat-fulgora-coralmium-agriculture"].value then
  --- @type SpoilageSolutionLib.CannedPerishableDefinition
  local canned_inert_coralmium_seed_def = {
    type = "item",
    name = "inert-coralmium-seed",
    icons = khaoslib_item.get_icons("inert-coralmium-seed"),
    order = "e[fill-barrel]-e[canned-fulgora]-a[canned-inert-coralmium-seed]",
    tint = util.color("628a8b"),
    default_import_location = "fulgora",
    no_spoilage = true,
  }

  spoilage_solution_lib.create_canned_item(canned_inert_coralmium_seed_def)
  spoilage_solution_lib.create_uncanning_recipe(canned_inert_coralmium_seed_def)

  spoilage_solution_lib.create_canned_perishable {
    type = "item",
    name = "charged-coralmium-seed",
    icons = khaoslib_item.get_icons("charged-coralmium-seed"),
    order = "e[fill-barrel]-e[canned-fulgora]-b[canned-charged-coralmium-seed]",
    tint = util.color("3de4e5"),
    default_import_location = "fulgora",
    spoil_result = "canned-inert-coralmium-seed",
  }
end
