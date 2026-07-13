local khaoslib_setting = require("__khaoslib__.settings.setting")

if mods["aquilo-seabloom-algaculture"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-compat-aquilo-seabloom-algaculture",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-a[aquilo-seabloom-algaculture]",
  } :commit()

  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-tweaks-frozen-seawilt",
    setting_type = "startup",
    default_value = true,
    order = "b[tweaks]-a[aquilo-seabloom-algaculture]-a[frozen-seawilt]",
  } :commit()
end
