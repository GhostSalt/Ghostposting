SMODS.Atlas {
  key = "JokerKitchenTarots",
  path = "GhostpostingJokerKitchenTarots.png",
  px = 71,
  py = 95
}

SMODS.Tarot {
  key = "horsemeat",
  pos = { x = 0, y = 0 },
  config = { max_highlighted = 5 },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        play_sound("tarot1")
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    for i = 1, #G.hand.highlighted do
      local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          G.hand.highlighted[i]:flip()
          play_sound("card1", percent)
          G.hand.highlighted[i]:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.2)
    for i = 1, #G.hand.highlighted do
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.1,
        func = function()
          local _card = G.hand.highlighted[i]
          local selectable_suits = {}
          for k, v in pairs(SMODS.Suits) do
            if k ~= _card.base.suit then
              selectable_suits[k] = v
            end
          end
          selectable_suits[_card.base.suit] = nil
          local chosen_suit = (pseudorandom_element(selectable_suits, pseudoseed("horsemeatsuit")) or { key = "Spades" })
          .key

          local selectable_ranks = {}
          for k, v in pairs(SMODS.Ranks) do
            if k ~= _card.base.id then
              selectable_ranks[k] = v
            end
          end
          selectable_ranks[_card.base.id] = nil
          local chosen_rank = (pseudorandom_element(selectable_ranks, pseudoseed("horsemeatrank")) or { key = "Ace" }).key

          SMODS.change_base(_card, chosen_suit, chosen_rank)
          return true
        end
      }))
    end
    for i = 1, #G.hand.highlighted do
      local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          G.hand.highlighted[i]:flip()
          play_sound("tarot2", percent, 0.6)
          G.hand.highlighted[i]:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,
  in_pool = function()
    for _, _card in ipairs(SMODS.find_card("j_gstpst_jokerkitchen")) do
      if not _card.ability.extra.used_so_far.horsemeat then return true end
    end
  end
}

SMODS.Tarot {
  key = "redhotchilipeppers",
  pos = { x = 1, y = 0 },
  config = { max_highlighted = 4 },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        play_sound("tarot1")
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        SMODS.destroy_cards(G.hand.highlighted)
        return true
      end
    }))
    delay(0.3)
  end,
  in_pool = function()
    for _, _card in ipairs(SMODS.find_card("j_gstpst_jokerkitchen")) do
      if not _card.ability.extra.used_so_far.redhotchilipeppers then return true end
    end
  end
}

SMODS.Tarot {
  key = "grassofdeath",
  pos = { x = 2, y = 0 },
  config = { max_highlighted = 3, min_highlighted = 2 },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        play_sound("tarot1")
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    for i = 1, #G.hand.highlighted do
      local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          G.hand.highlighted[i]:flip()
          play_sound("card1", percent)
          G.hand.highlighted[i]:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.2)
    local rightmost = G.hand.highlighted[1]
    for i = 1, #G.hand.highlighted do
      if G.hand.highlighted[i].T.x > rightmost.T.x then
        rightmost = G.hand.highlighted[i]
      end
    end
    for i = 1, #G.hand.highlighted do
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.1,
        func = function()
          if G.hand.highlighted[i] ~= rightmost then
            copy_card(rightmost, G.hand.highlighted[i])
          end
          return true
        end
      }))
    end
    for i = 1, #G.hand.highlighted do
      local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          G.hand.highlighted[i]:flip()
          play_sound("tarot2", percent, 0.6)
          G.hand.highlighted[i]:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,
  in_pool = function()
    for _, _card in ipairs(SMODS.find_card("j_gstpst_jokerkitchen")) do
      if not _card.ability.extra.used_so_far.grassofdeath then return true end
    end
  end
}

SMODS.Tarot {
  key = "oilfromiraq",
  pos = { x = 0, y = 1 },
  config = { max_highlighted = 3, mod_conv = "m_lucky" },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = "name_text", set = "Enhanced", key = card.ability.mod_conv } } }
  end,
  in_pool = function()
    for _, _card in ipairs(SMODS.find_card("j_gstpst_jokerkitchen")) do
      if not _card.ability.extra.used_so_far.oilfromiraq then return true end
    end
  end
}

SMODS.Tarot {
  key = "cheesefromsaopaulofrombrazil",
  pos = { x = 1, y = 1 },
  config = { max_highlighted = 3, mod_conv = "m_gold" },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = "name_text", set = "Enhanced", key = card.ability.mod_conv } } }
  end,
  in_pool = function()
    for _, _card in ipairs(SMODS.find_card("j_gstpst_jokerkitchen")) do
      if not _card.ability.extra.used_so_far.cheesefromsaopaulofrombrazil then return true end
    end
  end
}

SMODS.Tarot {
  key = "breadmadeinturkey",
  pos = { x = 2, y = 1 },
  config = { extra = { seal = "Blue" }, max_highlighted = 1 },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    local conv_card = G.hand.highlighted[1]
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound("tarot1")
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.1,
      func = function()
        conv_card:set_seal(card.ability.extra.seal, nil, true)
        return true
      end
    }))

    delay(0.5)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
  end,
  in_pool = function()
    for _, _card in ipairs(SMODS.find_card("j_gstpst_jokerkitchen")) do
      if not _card.ability.extra.used_so_far.breadmadeinturkey then return true end
    end
  end
}
