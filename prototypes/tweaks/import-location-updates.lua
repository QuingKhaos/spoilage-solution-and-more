local khaoslib_item = require("__khaoslib__.prototypes.item")

local import_locations = {
  gleba = {
    "spoilage",
    "yumako",
    "jellynut",
    "bioflux",
    "pentapod-egg",
    "agricultural-science-pack",
  },
  nauvis = {
    "biter-egg",
  }
}

for location, _items in pairs(import_locations) do
  for _, item in pairs(_items) do
    local canned_item = "canned-" .. item
    local frozen_item = "frozen-" .. item

    if khaoslib_item.exists(canned_item) then
      khaoslib_item:load(canned_item)
        :set {default_import_location = location}
        :commit()
    end

    if khaoslib_item.exists(frozen_item) then
      khaoslib_item:load(frozen_item)
        :set {default_import_location = location}
        :commit()
    end
  end
end
