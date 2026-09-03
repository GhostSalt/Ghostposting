SMODS.Atlas {
  key = "ManSticker",
  path = "GhostpostingManSticker.png",
  px = 71,
  py = 95
}

SMODS.Sticker({
  key = "man",
  atlas = "ManSticker",
  pos = { x = 0, y = 0 },
  sets = {
    Default = true,
    Enhanced = true
  },
  badge_colour = HEX("555555"),
  needs_enable_flag = true,
  rate = 0,
})

local debuff_ref = Card.set_debuff
function Card:set_debuff(should_debuff)
  if not (self.ability and self.ability["gstpst_man"]) then return debuff_ref(self, should_debuff) end
end



SMODS.Atlas {
  key = "ObjectsonaStickers",
  path = "GhostpostingObjectsonaStickers.png",
  px = 71,
  py = 95
}

SMODS.Sticker({
  key = "marked",
  atlas = "ObjectsonaStickers",
  pos = { x = 0, y = 0 },
  sets = {
    Default = true,
    Enhanced = true
  },
  badge_colour = HEX("6A3847"),
  needs_enable_flag = true,
  rate = 0,
  loc_vars = function(self, info_queue, card)
    local key = self.key
    if card.ability.gstpst_mark_key == "j_gstpst_objectsona" then
      key = key.."_objectsona"
    end
    return { key = key }
  end
})

function gstpst_mark_card(card, card_source)
  card:add_sticker("gstpst_marked", true)
  if not card_source.ability.gstpst_mark_id then
    G.GAME.gstpst_current_mark_id = (G.GAME.gstpst_current_mark_id or 0) + 1
    card_source.ability.gstpst_mark_id = G.GAME.gstpst_current_mark_id
  end
  card.ability.gstpst_mark_id = card_source.ability.gstpst_mark_id
  card.ability.gstpst_mark_key = card_source.config.center.key
end

function gstpst_detonate_marks(card_source)
  if not G.playing_cards then return end
  for _, v in ipairs(G.playing_cards) do
    if v and v.ability and v.ability.gstpst_marked and v.ability.gstpst_mark_id == card_source.ability.gstpst_mark_id then
      SMODS.destroy_cards(v, { bypass_eternal = true, immediate = true, skip_anim = true })
    end
  end
end