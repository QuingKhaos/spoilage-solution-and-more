local khaoslib_setting = require("__khaoslib__.settings.setting")

if mods["aquilo-seabloom-algaculture"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-compat-aquilo-seabloom-algaculture",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-b[aquilo-seabloom-algaculture]",
  } :commit()

  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-tweaks-frozen-seawilt",
    setting_type = "startup",
    default_value = true,
    order = "b[tweaks]-a[aquilo-seabloom-algaculture]-a[frozen-seawilt]",
  } :commit()
end

if mods["boompuff-agriculture"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-compat-boompuff-agriculture",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-a[boompuff-agriculture]",
  } :commit()
end

if mods["fluroflux"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-compat-fluroflux",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-a[fluroflux]",
  } :commit()
end

if mods["fulgora-coralmium-agriculture"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-compat-fulgora-coralmium-agriculture",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-b[fulgora-coralmium-agriculture]",
  } :commit()
end

if mods["pHactorio"] then
  khaoslib_setting:load {
    type = "bool-setting",
    name = "spoilage-solution-and-more-compat-pHactorio",
    setting_type = "startup",
    default_value = true,
    order = "a[compat]-a[pHactorio]",
  } :commit()
end

khaoslib_setting:load {
  type = "bool-setting",
  name = "spoilage-solution-and-more-tweaks-frozen-spoilage",
  setting_type = "startup",
  default_value = true,
  order = "b[tweaks]-b[frozen-spoilage]",
} :commit()

khaoslib_setting:load {
  type = "bool-setting",
  name = "spoilage-solution-and-more-tweaks-frozen-eggs",
  setting_type = "startup",
  default_value = true,
  order = "b[tweaks]-c[frozen-eggs]",
} :commit()

khaoslib_setting:load {
  type = "bool-setting",
  name = "spoilage-solution-and-more-tweaks-hide-canned",
  setting_type = "startup",
  default_value = true,
  order = "b[tweaks]-d[hide-canned]",
} :commit()

khaoslib_setting:load {
  type = "bool-setting",
  name = "spoilage-solution-and-more-tweaks-hide-frozen",
  setting_type = "startup",
  default_value = true,
  order = "b[tweaks]-e[hide-frozen]",
} :commit()
