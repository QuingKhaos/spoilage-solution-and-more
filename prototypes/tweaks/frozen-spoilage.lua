local khaoslib_item = require("__khaoslib__.prototypes.item")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")

if settings.startup["spoilage-solution-and-more-tweaks-frozen-spoilage"].value then
  local frozen_spoilage_def = {
    type = "item",
    name = "spoilage",
    icons = khaoslib_item.get_icons("spoilage"),
    order = "c[nutrients]-aa[frozen-spoilage]",
    subgroup = "agriculture-processes",
    default_import_location = "gleba",
    no_spoilage = true,
  }

  spoilage_solution_lib.create_frozen_item(frozen_spoilage_def)
  spoilage_solution_lib.create_unfreezing_recipe(frozen_spoilage_def)
end
