SMODS.Atlas {
  key = "modicon",
  path = "GhostpostingLogo.png",
  px = 34,
  py = 34
}

SMODS.current_mod.optional_features = { cardareas = { unscored = true } }

to_big = to_big or function(x) return x end
to_number = to_number or function(x) return x end

if not count_consumables then
  count_consumables = function()
    if G.consumeables.get_total_count then
      return G.consumeables:get_total_count()
    else
      return #G.consumeables.cards + G.GAME.consumeable_buffer
    end
  end
end

local allFolders = { "none", "items" }
local allFiles = { ["none"] = {}, ["items"] = { "Utility", "Jokers", "Tarots", "Decks" } }

for i = 1, #allFolders do
  if allFolders[i] == "none" then
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFiles[allFolders[i]][j] .. ".lua"))()
    end
  else
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFolders[i] .. "/" .. allFiles[allFolders[i]][j] .. ".lua"))()
    end
  end
end

if not Ghostposting then Ghostposting = {} end
Ghostposting.config = SMODS.current_mod.config

local gstpstConfigTab = function()
  gstpst_nodes = {}
  config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} } } }
  gstpst_nodes[#gstpst_nodes + 1] = config
  gstpst_nodes[#gstpst_nodes + 1] = create_toggle({
    label = localize("gstpst_disable_custom_music"),
    active_colour = HEX("40c76d"),
    ref_table = Ghostposting.config,
    ref_value = "custom_music_disabled",
    callback = function()
    end,
  })
  return {
    n = G.UIT.ROOT,
    config = {
      emboss = 0.05,
      minh = 6,
      r = 0.1,
      minw = 10,
      align = "cm",
      padding = 0.2,
      colour = G.C.BLACK,
    },
    nodes = gstpst_nodes,
  }
end

SMODS.current_mod.config_tab = gstpstConfigTab