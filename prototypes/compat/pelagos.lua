local khaoslib_item = require("__khaoslib__.prototypes.item")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")

if mods["pelagos"] and settings.startup["spoilage-solution-and-more-compat-pelagos"].value then
  spoilage_solution_lib.create_canned_perishable {
    type = "item",
    name = "coconut",
    icons = khaoslib_item.get_icons("coconut"),
    order = "e[fill-barrel]-c[canned-pelagos]-a[canned-coconut]",
    tint = util.color("6d360c"),
    default_import_location = "pelagos"
  }

  spoilage_solution_lib.create_canned_perishable {
    type = "item",
    name = "fermented-fish",
    icons = khaoslib_item.get_icons("fermented-fish"),
    order = "e[fill-barrel]-c[canned-pelagos]-b[canned-fermented-fish]",
    tint = util.color("c0d352"),
    default_import_location = "pelagos"
  }

  spoilage_solution_lib.create_frozen_perishable {
    type = "item",
    name = "coconut",
    icons = khaoslib_item.get_icons("coconut"),
    order = "b[agriculture]-c[frozen-agro]-c[frozen-coconut]",
    subgroup = "agriculture-processes",
    default_import_location = "pelagos",
  }

  spoilage_solution_lib.create_frozen_perishable {
    type = "item",
    name = "fermented-fish",
    icons = khaoslib_item.get_icons("fermented-fish"),
    order = "b[organic-processing]-c[frozen-fermented-fish]",
    subgroup = "agriculture-products",
    default_import_location = "pelagos",
  }

  spoilage_solution_lib.create_frozen_perishable {
    type = "item",
    name = "copper-biter-egg",
    icons = khaoslib_item.get_icons("copper-biter-egg"),
    order = "c[eggs]-e[frozen-copper-biter-egg]",
    subgroup = "agriculture-products",
    default_import_location = "pelagos",
    spoil_to_trigger_result = settings.startup["spoilage-solution-and-more-tweaks-frozen-eggs"].value and khaoslib_item.get("copper-biter-egg").spoil_to_trigger_result or nil
  }
end
