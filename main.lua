--[[SMODS.Atlas {
  key = "modicon",
  path = "BFDIIcon.png",
  px = 34,
  py = 34
}]]--

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
local allFiles = { ["none"] = {}, ["items"] = { "Jokers" } }

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