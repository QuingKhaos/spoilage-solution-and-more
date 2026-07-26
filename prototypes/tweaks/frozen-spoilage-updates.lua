local khaoslib_item = require("__khaoslib__.prototypes.item")

if settings.startup["spoilage-solution-and-more-tweaks-frozen-spoilage"].value then
  --- @type data.ItemID[] List of all frozen items.
  local frozen_items = khaoslib_item.find(function(item)
    return item.name:match("^frozen%-") ~= nil
  end)

  for _, item in pairs(frozen_items) do
    if khaoslib_item.exists(item) and khaoslib_item.get(item).spoil_result == "spoilage" then
      khaoslib_item:load(item)
        :set {spoil_result = "frozen-spoilage"}
        :commit()
    end
  end
end
