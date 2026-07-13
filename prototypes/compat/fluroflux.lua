local khaoslib_item = require("__khaoslib__.prototypes.item")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")
local util = require("util")

if mods["fluroflux"] and settings.startup["spoilage-solution-and-more-compat-fluroflux"].value then
  --- @type SpoilageSolutionLib.CannedPerishableDefinition
  local canned_stingfrond_seed_def = {
    type = "item",
    name = "stingfrond-seed",
    icons = khaoslib_item.get_icons("stingfrond-seed"),
    order = "e[fill-barrel]-c[canned-gleba]-g[canned-stingfrond-seed]",
    tint = util.color("6a8eec"),
    default_import_location = "gleba",
    no_spoilage = true,
  }

  spoilage_solution_lib.create_canned_item(canned_stingfrond_seed_def)
  spoilage_solution_lib.create_uncanning_recipe(canned_stingfrond_seed_def)

  spoilage_solution_lib.create_canned_perishable {
    type = "item",
    name = "nettles",
    icons = khaoslib_item.get_icons("nettles"),
    order = "e[fill-barrel]-c[canned-gleba]-h[canned-nettles]",
    tint = util.color("a1d5d9"),
    default_import_location = "gleba",
    spoil_result = "canned-stingfrond-seed",
  }

  spoilage_solution_lib.create_canned_perishable {
    type = "item",
    name = "fluroflux",
    icons = khaoslib_item.get_icons("fluroflux"),
    order = "e[fill-barrel]-c[canned-gleba]-i[canned-fluroflux]",
    tint = util.color("069aba"),
    default_import_location = "gleba",
  }

  spoilage_solution_lib.create_frozen_perishable {
    type = "item",
    name = "nettles",
    icons = khaoslib_item.get_icons("nettles"),
    order = "b[agriculture]-e[frozen-agro]-a[frozen-nettles]",
    subgroup = "agriculture-processes",
    default_import_location = "gleba",
    spoil_result = "stingfrond-seed",
  }

  spoilage_solution_lib.create_frozen_perishable {
    type = "item",
    name = "fluroflux",
    icons = khaoslib_item.get_icons("fluroflux"),
    order = "c[nutrients]-b[frozen-fluroflux]",
    subgroup = "agriculture-processes",
    default_import_location = "gleba",
  }
end
