
local khaoslib_item = require("__khaoslib__.prototypes.item")

khaoslib_item:load("frozen-biter-egg")
  :unset("spoil_result")
  :set {spoil_to_trigger_result = khaoslib_item.get("biter-egg").spoil_to_trigger_result}
  :commit()

khaoslib_item:load("frozen-pentapod-egg")
  :unset("spoil_result")
  :set {spoil_to_trigger_result = khaoslib_item.get("pentapod-egg").spoil_to_trigger_result}
  :commit()
