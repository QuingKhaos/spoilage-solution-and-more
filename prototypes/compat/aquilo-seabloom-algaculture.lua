local khaoslib_capsule = require("__khaoslib__.prototypes.capsule")
local khaoslib_item = require("__khaoslib__.prototypes.item")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")
local util = require("util")

if mods["aquilo-seabloom-algaculture"] and settings.startup["spoilage-solution-and-more-compat-aquilo-seabloom-algaculture"].value then
  --- @type SpoilageSolutionLib.CannedPerishableDefinition
  local canned_seawilt_def = {
    type = "item",
    name = "seawilt",
    icons = khaoslib_item.get_icons("seawilt"),
    order = "e[fill-barrel]-d[canned-aquilo]-a[canned-seawilt]",
    tint = util.color("945344"),
    default_import_location = "aquilo",
    no_spoilage = true,
  }

  spoilage_solution_lib.create_canned_item(canned_seawilt_def)
  spoilage_solution_lib.create_uncanning_recipe(canned_seawilt_def)

  --- @type SpoilageSolutionLib.CannedPerishableDefinition
  local canned_seaweed_def = {
    type = "capsule",
    name = "seaweed",
    icons = khaoslib_capsule.get_icons("seaweed"),
    order = "e[fill-barrel]-d[canned-aquilo]-b[canned-seaweed]",
    tint = util.color("a8ac76"),
    default_import_location = "aquilo",
    spoil_result = "canned-seawilt",
  }

  spoilage_solution_lib.create_canned_perishable(canned_seaweed_def)

  --- @type SpoilageSolutionLib.CannedPerishableDefinition
  local canned_seaweed_snack_def = {
    type = "capsule",
    name = "seaweed-snack",
    icons = khaoslib_capsule.get_icons("seaweed-snack"),
    order = "e[fill-barrel]-d[canned-aquilo]-c[canned-seaweed-snack]",
    tint = util.color("51592f"),
    default_import_location = "aquilo",
    spoil_result = "canned-seawilt",
  }

  spoilage_solution_lib.create_canned_perishable(canned_seaweed_snack_def)

  if settings.startup["spoilage-solution-and-more-tweaks-frozen-seawilt"].value then
    --- @type SpoilageSolutionLib.FrozenPerishableDefinition
    local frozen_seawilt_def = {
      type = "item",
      name = "seawilt",
      icons = khaoslib_item.get_icons("seawilt"),
      order = "d[agriculture]-e[frozen-agro]-a[frozen-seawilt]",
      subgroup = mods["bioprocessing-tab"] and "aquilo-algaculture" or "aquilo-processes",
      default_import_location = "aquilo",
      no_spoilage = true,
    }

    spoilage_solution_lib.create_frozen_item(frozen_seawilt_def)
    spoilage_solution_lib.create_unfreezing_recipe(frozen_seawilt_def)
  end

  --- @type SpoilageSolutionLib.FrozenPerishableDefinition
  local frozen_seaweed_def = {
    type = "capsule",
    name = "seaweed",
    icons = khaoslib_capsule.get_icons("seaweed"),
    order = "d[agriculture]-e[frozen-agro]-b[frozen-seaweed]",
    subgroup = mods["bioprocessing-tab"] and "aquilo-algaculture" or "aquilo-processes",
    default_import_location = "aquilo",
    spoil_result = "seawilt",
  }

  spoilage_solution_lib.create_frozen_perishable(frozen_seaweed_def)

  --- @type SpoilageSolutionLib.FrozenPerishableDefinition
  local frozen_seabloom_def = {
    type = "capsule",
    name = "seabloom",
    icons = khaoslib_capsule.get_icons("seabloom"),
    order = "d[agriculture]-e[frozen-agro]-c[frozen-seabloom]",
    subgroup = mods["bioprocessing-tab"] and "aquilo-algaculture" or "aquilo-processes",
    default_import_location = "aquilo",
    spoil_result = settings.startup["spoilage-solution-and-more-tweaks-frozen-seawilt"].value and "frozen-seawilt" or "seawilt",
  }

  spoilage_solution_lib.create_frozen_perishable(frozen_seabloom_def)
end
