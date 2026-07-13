local khaoslib_capsule = require("__khaoslib__.prototypes.capsule")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")
local util = require("util")

if mods["boompuff-agriculture"] and settings.startup["spoilage-solution-and-more-compat-boompuff-agriculture"].value then
  --- @type SpoilageSolutionLib.CannedPerishableDefinition
  local canned_boompuff_spore_def = {
    type = "capsule",
    name = "boompuff-spore",
    icons = khaoslib_capsule.get_icons("boompuff-spore"),
    order = "e[fill-barrel]-c[canned-gleba]-f[canned-boompuff-spore]",
    tint = util.color("e9a44d"),
    default_import_location = "gleba",
  }

  if settings.startup["spoiled-explosions"].value then
    canned_boompuff_spore_def.spoil_to_trigger_result = {
      items_per_trigger = 5,
      trigger = {
        type = "direct",
        action_delivery = {
          type = 'instant',
          source_effects ={
            type = "script",
            effect_id = "boompuff-explosion-effect"
          }
        }
      }
    }
  end

  spoilage_solution_lib.create_canned_perishable(canned_boompuff_spore_def)
end
