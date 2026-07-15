local khaoslib_capsule = require("__khaoslib__.prototypes.capsule")
local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")

if mods["pHactorio"] and settings.startup["spoilage-solution-and-more-compat-pHactorio"].value then
  spoilage_solution_lib.create_canned_perishable {
    type = "capsule",
    name = "yumako-pickled",
    icons = khaoslib_capsule.get_icons("yumako-pickled"),
    order = "e[fill-barrel]-c[canned-gleba]-j[canned-yumako-pickled]",
    tint = util.color("b46925"),
    default_import_location = "gleba"
  }

  spoilage_solution_lib.create_canned_perishable {
    type = "capsule",
    name = "jellynut-pickled",
    icons = khaoslib_capsule.get_icons("jellynut-pickled"),
    order = "e[fill-barrel]-c[canned-gleba]-k[canned-jellynut-pickled]",
    tint = util.color("a97078"),
    default_import_location = "gleba"
  }
end
