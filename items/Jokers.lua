SMODS.Atlas {
  key = "Jokers1",
  path = "GhostpostingJokers1.png",
  px = 71,
  py = 95
}

if not next(SMODS.find_mod("ColdBeans")) then --Markiplier
  SMODS.Atlas {
    key = "Markiplier",
    path = "GhostpostingMarkiplier.png",
    px = 71,
    py = 95
  }

  SMODS.Sound({
    key = "eightyseven",
    path = "gstpst_eightyseven.ogg"
  })

  for i = 1, 7 do
    SMODS.Sound({
      key = "markiplier-0" .. i,
      path = "gstpst_markiplier-0" .. i .. ".ogg"
    })
  end

  SMODS.Joker({
    key = "markiplier",
    config = { extra = { added_xmult = 0.1, current_xmult = 1 } },
    rarity = 2,
    atlas = "Markiplier",
    pos = { x = 0, y = 0 },
    flipbook_anim_states = {
      ["sob"] = {
        anim = {
          { xrange = { first = 0, last = 7 }, yrange = { first = 0, last = 6 }, t = 0.1 },
          { xrange = { first = 0, last = 5 }, y = 7,                            t = 0.1 }
        },
        loop = true
      },

      ["happy"] = {
        anim = { { x = 6, y = 7, t = 5 } },
        loop = false,
        continuation = "sob"
      },

      ["shocked"] = {
        anim = { { x = 7, y = 7, t = 2 } },
        loop = false,
        continuation = "sob"
      }
    },
    flipbook_anim_initial_state = "sob",
    cost = 7,
    loc_vars = function(self, info_queue, card)
      key = self.key .. "_" .. math.random(1, 8)
      return { key = key, vars = { card.ability.extra.added_xmult, card.ability.extra.current_xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    add_to_deck = function(self, card, from_debuff)
      play_sound("gstpst_markiplier-0" .. math.random(7), 0.6 + (math.random() * 0.8), 0.9)
      card:flipbook_set_anim_state("happy")
    end,
    calculate = function(self, card, context)
      if context.joker_main and card.ability.extra.current_xmult > 1 then
        return {
          xmult = card.ability.extra
              .current_xmult
        }
      end

      if context.before and not context.blueprint then
        for _, v in ipairs(context.scoring_hand) do
          if v and not SMODS.has_no_rank(v) and (v:get_id() == 9 or v:get_id() == 8 or v:get_id() == 7) then
            G.E_MANAGER:add_event(Event({
              trigger = "before",
              timer = "REAL",
              delay = 1.9,
              func = function()
                card:flipbook_set_anim_state("shocked")
                play_sound("gstpst_eightyseven", 0.9 + (math.random() * 0.1), 0.87)
                return true
              end
            }))
            card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
            return { message = localize("k_upgrade_ex") }
          end
        end
      end
    end
  })
end

do --Tom Scott, Ed Balls, Guy Standing, Crispiest Fries, Exploding Watermelon
  SMODS.Atlas {
    key = "Xnopyt",
    path = "GhostpostingXnopyt.png",
    px = 71,
    py = 95
  }

  SMODS.Sound({
    key = "xnopyt_yes",
    path = "gstpst_xnopyt_yes.ogg"
  })

  for i = 1, 9 do
    SMODS.Sound({
      key = "xnopyt-0" .. i,
      path = "gstpst_xnopyt-0" .. i .. ".ogg"
    })
  end

  for i = 10, 11 do
    SMODS.Sound({
      key = "xnopyt-" .. i,
      path = "gstpst_xnopyt-" .. i .. ".ogg"
    })
  end

  SMODS.Joker({
    key = "xnopyt",
    config = { extra = { added_xmult = 0.2, current_xmult = 1 } },
    rarity = 2,
    atlas = "Xnopyt",
    pos = { x = 0, y = 0 },
    flipbook_anim_states = {
      ["xnopyt"] = {
        anim = {
          { xrange = { first = 0, last = 8 }, yrange = { first = 0, last = 6 }, t = 0.1 },
          { xrange = { first = 0, last = 4 }, y = 7,                            t = 0.1 }
        },
        loop = true
      },

      ["blown"] = {
        anim = { { x = 5, y = 7, t = 2 } },
        loop = false,
        continuation = "xnopyt"
      },

      ["wow"] = {
        anim = { { x = 6, y = 7, t = 0.6 } },
        loop = false,
        continuation = "xnopyt"
      }
    },
    flipbook_anim_initial_state = "xnopyt",
    cost = 7,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.added_xmult, card.ability.extra.current_xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    add_to_deck = function(self, card, from_debuff)
      local number = math.random(11)
      if number < 10 then number = "0" .. number end
      play_sound("gstpst_xnopyt-" .. number, 1, 0.9)
      card:flipbook_set_anim_state("blown")
    end,
    calculate = function(self, card, context)
      if context.joker_main and card.ability.extra.current_xmult > 1 then
        return {
          xmult = card.ability.extra
              .current_xmult
        }
      end

      if context.before and not context.blueprint then
        for _, v in ipairs(context.scoring_hand) do
          if v and not SMODS.has_no_rank(v) and v:get_id() == 10 then
            G.E_MANAGER:add_event(Event({
              trigger = "before",
              timer = "REAL",
              delay = 0.6,
              func = function()
                card:flipbook_set_anim_state("wow")
                play_sound("gstpst_xnopyt_yes", 0.9 + (math.random() * 0.1), 0.9)
                return true
              end
            }))
            card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
            return { message = localize("k_upgrade_ex") }
          end
        end
      end
    end
  })

  SMODS.Sound({
    key = "gordonramsay_waterphone",
    path = "gstpst_gordonramsay_waterphone.ogg"
  })

  for i = 1, 7 do
    SMODS.Sound({
      key = "gordonramsay_getout-0" .. i,
      path = "gstpst_gordonramsay_getout-0" .. i .. ".ogg"
    })
  end

  SMODS.Joker({
    key = "gordonramsay",
    config = { extra = { xmult = 2, money = 5, requirement = 4, stage = 0 } },
    rarity = 3,
    atlas = "Jokers1",
    pos = { x = 7, y = 9 },
    flipbook_anim_states = {
      stage_0 = { anim = { { x = 7, y = 9, t = 1 } }, loop = false },
      stage_1 = { anim = { { x = 8, y = 9, t = 1 } }, loop = false },
      stage_2 = { anim = { { x = 9, y = 9, t = 1 } }, loop = false },
      stage_3 = { anim = { { x = 10, y = 9, t = 1 } }, loop = false }
    },
    flipbook_anim_initial_state = "stage_0",
    cost = 8,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult, card.ability.extra.money, card.ability.extra.requirement } }
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.joker_main and card.ability.extra.stage < 3 then
        return { xmult = card.ability.extra.xmult }
      end

      if context.before and #context.scoring_hand < card.ability.extra.requirement then
        card.ability.extra.stage = card.ability.extra.stage + 1

        local durations = { 4, 3.5, 1.5, 2.5, 8, 4.5, 4.5 }
        local sound = math.random(7)
        local stored_music_vol = G.SETTINGS.SOUND.music_volume
        G.E_MANAGER:add_event(Event({
          trigger = "before",
          delay = ((card.ability.extra.stage < 3) or Ghostposting.config.family_friendly) and 4 or durations[sound],
          timer = "REAL",
          func = function()
            if card.ability.extra.stage < 3 then
              play_sound("gstpst_gordonramsay_waterphone", 1, 0.8)
              G.SETTINGS.SOUND.music_volume = 0
              card:flipbook_set_anim_state("stage_" .. card.ability.extra.stage)
            else
              if not Ghostposting.config.family_friendly then
                play_sound("gstpst_gordonramsay_getout-0" .. sound)
              else
                play_sound("gstpst_gordonramsay_waterphone", 1, 0.8)
              end
              card:flipbook_set_anim_state("stage_3")
            end
            return true
          end
        }))
        if card.ability.extra.stage >= 3 then
          SMODS.destroy_cards({ card })
        else
          G.E_MANAGER:add_event(Event({
            func = function()
              G.SETTINGS.SOUND.music_volume = stored_music_vol
              return true
            end
          }))
        end
      end
    end,
    calc_dollar_bonus = function(self, card)
      return card.ability.extra.money
    end,
    add_to_deck = function(self, card, from_debuff)
      card:flipbook_set_anim_state("stage_" .. card.ability.extra.stage)
    end
  })

  SMODS.Sound({
    key = "edballs",
    path = "gstpst_edballs.ogg",
  })

  SMODS.Joker({
    key = "edballs",
    config = { extra = { retriggers = 1, sound_played = false } },
    rarity = 3,
    atlas = "Jokers1",
    pos = { x = 3, y = 9 },
    cost = 8,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.retriggers } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
        local spades = 0
        for _, v in ipairs(G.hand.cards) do
          if v:is_suit("Spades") then spades = spades + 1 end
        end

        if spades > 0 then
          if not card.ability.extra.sound_played then
            card.ability.extra.sound_played = true

            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound("gstpst_edballs")
                return true
              end
            }))
          end
          return { repetitions = spades * card.ability.extra.retriggers }
        end
      end
    end
  })

  SMODS.Sound({
    key = "guystanding",
    path = "gstpst_guystanding.ogg",
  })

  SMODS.Joker({
    key = "guystanding",
    config = { extra = { target_hands = 3, current_hands = 0, money = 5, is_standing = false } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 4, y = 9 },
    flipbook_anim_states = {
      sitting = {
        anim = { { x = 4, y = 9, t = 1 } },
        loop = false
      },
      standing = {
        anim = { { x = 5, y = 9, t = 1 } },
        loop = false
      }
    },
    flipbook_anim_initial_state = "sitting",
    cost = 6,
    loc_vars = function(self, info_queue, card)
      local key = "j_gstpst_guystanding"
      gstpst_guystanding_status = gstpst_guystanding_status or card.ability.extra.is_standing
      if not gstpst_guystanding_status ~= not card.fake_card then key = key .. "_standing" end

      if not card.fake_card then
        gstpst_guystanding_status = card.ability.extra.is_standing
        info_queue[#info_queue + 1] = G.P_CENTERS.j_gstpst_guystanding
      else
        gstpst_guystanding_status = nil
      end

      return { key = key, vars = { card.ability.extra.target_hands, card.ability.extra.target_hands - card.ability.extra.current_hands, card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if not card.ability.extra.is_standing and context.before and not context.blueprint then
        card.ability.extra.current_hands = card.ability.extra.current_hands + 1

        if card.ability.extra.current_hands >= card.ability.extra.target_hands then
          card.ability.extra.is_standing = true
          card.ability.extra.current_hands = 0
          local stand = function(params)
            local _card = params.card
            _card:flipbook_set_anim_state("standing")
            if not _card.ability.extra.sound_played then
              _card.ability.extra.sound_played = true
              play_sound("gstpst_guystanding")
            end
          end

          gstpst_flip_card_and_do(card, stand, { card = card })
        else
          return { message = card.ability.extra.current_hands .. "/" .. card.ability.extra.target_hands }
        end
      end

      if card.ability.extra.is_standing and context.selling_card and context.card.config.center.set ~= "Joker" then
        return { dollars = card.ability.extra.money }
      end

      if card.ability.extra.is_standing and context.setting_blind and not context.blueprint then
        card.ability.extra.is_standing = false
        local sit = function(params)
          params.card:flipbook_set_anim_state("sitting")
        end

        gstpst_flip_card_and_do(card, sit, { card = card })
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      card:flipbook_set_anim_state(card.ability.extra.is_standing and "standing" or "sitting")
    end
  })

  SMODS.Joker({
    key = "crispiestfries",
    config = { extra = { mult = 12, count = 0 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 6, y = 9 },
    draw = function(self, card, layer)
      if self.discovered or card.params.bypass_discovery_center then
        if card.ability.extra.active == false then
          card.children.center:draw_shader("debuff", nil, card.ARGS.send_to_shader)
        end
      end
    end,
    cost = 5,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.mult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    calculate = function(self, card, context)
      if context.joker_main and card.ability.extra.active then
        return { mult = card.ability.extra.mult }
      end

      if context.gstpst_crispiestfries and context.gstpst_crispiestfries == card and not card.ability.extra.dont_poll then
        card.ability.extra.dont_poll = true
        G.E_MANAGER:add_event(Event({
          func = function()
            card.ability.extra.active = true
            return true
          end
        }))
        return { message = localize("k_active_ex") }
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      card.ability.extra.target = 60 + (pseudorandom("gstpst_crispiestfries") * 120)
      card.ability.extra.active = false
    end
  })

  SMODS.Atlas {
    key = "BrandonFarris",
    path = "GhostpostingBrandonFarris.png",
    px = 71,
    py = 95
  }

  SMODS.Sound({
    key = "explodingwatermelon",
    path = "gstpst_explodingwatermelon.ogg",
  })

  SMODS.Joker({
    key = "explodingwatermelon",
    config = { extra = { xmult = 2, count = 0, destroyed = false } },
    rarity = 1,
    atlas = "BrandonFarris",
    pos = { x = 4, y = 9 },
    flipbook_anim_states = {
      passive = {
        anim = { { x = 0, y = 0, t = 1 } },
        loop = false
      },
      exploding = {
        anim = {
          { xrange = { first = 1, last = 8 }, y = 0,                            t = 0.1 },
          { xrange = { first = 0, last = 8 }, yrange = { first = 1, last = 3 }, t = 0.1 },
          { xrange = { first = 0, last = 7 }, y = 4,                            t = 0.1 },
          { x = 7,                            y = 4,                            t = 1 }
        },
        loop = false
      }
    },
    flipbook_anim_initial_state = "passive",
    cost = 5,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.joker_main then
        return { xmult = card.ability.extra.xmult }
      end

      if context.gstpst_explodedwatermelon and context.gstpst_explodedwatermelon == card and not card.ability.extra.destroyed then
        card.ability.extra.destroyed = true
        G.E_MANAGER:add_event(Event({
          trigger = "before",
          delay = 4.3,
          timer = "REAL",
          func = function()
            play_sound("gstpst_explodingwatermelon", 1, 0.7)
            card:flipbook_set_anim_state("exploding")
            return true
          end
        }))
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.destroy_cards({ card })
            return true
          end
        }))
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      card.ability.extra.target = 180 + (pseudorandom("gstpst_explodingwatermelon") * 120)
    end
  })

  local explodingwatermelon_update_ref = Game.update
  function Game:update(dt)
    if not G.SETTINGS.paused then
      for _, v in ipairs(SMODS.find_card("j_gstpst_explodingwatermelon")) do
        v.ability.extra.count = v.ability.extra.count + dt
        if v.ability.extra.count >= v.ability.extra.target and not v.ability.extra.destroyed then
          SMODS.calculate_context({ gstpst_explodedwatermelon = v })
        end
      end

      for _, v in ipairs(SMODS.find_card("j_gstpst_crispiestfries")) do
        v.ability.extra.count = v.ability.extra.count + dt
        if v.ability.extra.count >= v.ability.extra.target and not v.ability.extra.dontpoll then
          SMODS.calculate_context({ gstpst_crispiestfries = v })
        end
      end
    end

    return explodingwatermelon_update_ref(self, dt)
  end
end

if not next(SMODS.find_mod("ColdBeans")) then --Fashion is my Passion
  SMODS.Joker({
    key = "fashionismypassion",
    config = { extra = { chips = 50 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 1, y = 9 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.individual and not context.repetition and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
        return { chips = card.ability.extra.chips }
      end
    end
  })
end

do --Postal Dude
  SMODS.Sound({
    key = "postaldude_1a",
    path = "gstpst_postaldude_1a.ogg"
  })
  SMODS.Sound({
    key = "postaldude_1b",
    path = "gstpst_postaldude_1b.ogg"
  })
  SMODS.Sound({
    key = "postaldude_2a",
    path = "gstpst_postaldude_2a.ogg"
  })
  SMODS.Sound({
    key = "postaldude_2b",
    path = "gstpst_postaldude_2b.ogg"
  })
  SMODS.Sound({
    key = "postaldude_3a",
    path = "gstpst_postaldude_3a.ogg"
  })
  SMODS.Sound({
    key = "postaldude_3b",
    path = "gstpst_postaldude_3b.ogg"
  })


  SMODS.Sound({
    key = "postaldude_ohno1",
    path = "gstpst_postaldude_ohno1.ogg"
  })
  SMODS.Sound({
    key = "postaldude_ohno2",
    path = "gstpst_postaldude_ohno2.ogg"
  })

  SMODS.Sound({
    key = "postaldude_thanks",
    path = "gstpst_postaldude_thanks.ogg"
  })

  SMODS.Sound({
    key = "postaldude_add",
    path = "gstpst_postaldude_add.ogg"
  })

  for i = 1, 4 do
    SMODS.Sound({
      key = "postaldude_sell" .. i,
      path = "gstpst_postaldude_sell" .. i .. ".ogg"
    })
  end

  SMODS.Joker({
    key = "postaldude",
    config = { extra = { odds = 6, added_commons = 1, no_of_signatures = 0, max_commons = 5, next_sound = "1" } },
    rarity = 3,
    atlas = "Jokers1",
    pos = { x = 11, y = 9 },
    cost = 8,
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
      local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "gstpst_postaldude")
      return { vars = { num, denom, card.ability.extra.added_commons, card.ability.extra.no_of_signatures, card.ability.extra.max_commons } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.buying_card and context.card.config.center.set == "Joker" and context.card ~= card and not card.getting_sliced
          and not context.blueprint and card.ability.extra.no_of_signatures < card.ability.extra.max_commons then
        if not Ghostposting.config.family_friendly then
          local signed = SMODS.pseudorandom_probability(card, "gstpst_postaldude", 1, card.ability.extra.odds)
          local durations = {
            ["1a"] = 2.3,
            ["1b"] = 1.7,
            ["2a"] = 1.6,
            ["2b"] = 3.2,
            ["3a"] = 3,
            ["3b"] = 3.2
          }

          local sound = card.ability.extra.next_sound .. ((math.random() < 0.5) and "a" or "b")
          local duration = durations[sound]
          local interval = 0.3
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound("gstpst_postaldude_" .. sound, 1, 0.8)
              return true
            end
          }))
          for i = 1, math.floor(duration / interval) do
            G.E_MANAGER:add_event(Event({
              trigger = "before",
              timer = "REAL",
              delay = interval,
              func = function()
                card:juice_up()
                return true
              end
            }))
          end
          G.E_MANAGER:add_event(Event({
            trigger = "before",
            timer = "REAL",
            delay = (duration % interval) + 1,
            func = function()
              return true
            end
          }))
          local voice_pitch = 0.9 + (math.random() * 0.4)
          local voice_times = 7 + math.random(3)
          local voice_types = {}
          for i = 1, voice_times do
            voice_types[#voice_types + 1] = math.random(1, 11)
            while voice_types[#voice_types] == voice_types[#voice_types - 1] do
              voice_types[#voice_types] = math.random(1, 11)
            end
          end

          for i = 1, voice_times do
            G.E_MANAGER:add_event(Event({
              trigger = "after",
              timer = "REAL",
              delay = 0.13,
              func = function()
                context.card:juice_up()
                play_sound("voice" .. voice_types[i], voice_pitch, 0.5)
                return true
              end
            }))
          end
          G.E_MANAGER:add_event(Event({
            trigger = "after",
            timer = "REAL",
            delay = 0.2,
            func = function()
              if signed then
                card.ability.extra.next_sound = "1"
                card.ability.extra.no_of_signatures = card.ability.extra.no_of_signatures + card.ability.extra.added_commons
                if card.ability.extra.no_of_signatures > card.ability.extra.max_commons then card.ability.extra.no_of_signatures = card.ability.extra.max_commons end
                play_sound("gstpst_postaldude_thanks", 1, 0.8)
              else
                local next_options = { ["1"] = "2", ["2"] = "3", ["3"] = "3" }
                card.ability.extra.next_sound = next_options[card.ability.extra.next_sound]
                play_sound("gstpst_postaldude_ohno" .. math.random(2), 1, 0.8)
              end
              return true
            end
          }))
        else
          if SMODS.pseudorandom_probability(card, "gstpst_postaldude", 1, card.ability.extra.odds) then
            card.ability.extra.no_of_signatures = card.ability.extra.no_of_signatures + card.ability.extra.added_commons
            if card.ability.extra.no_of_signatures > card.ability.extra.max_commons then card.ability.extra.no_of_signatures = card.ability.extra.max_commons end
            return { message = localize("k_gstpst_signed_ex"), message_card = card }
          end
        end
      end

      if context.setting_blind and not context.blueprint then
        card.ability.extra.next_sound = "1"
      end

      if context.selling_self then
        if not context.blueprint then
          play_sound("gstpst_postaldude_sell" .. math.random(4), 1, 0.8)
        end


        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("timpani")
            for i = 1, card.ability.extra.no_of_signatures do
              SMODS.add_card {
                set = "Joker",
                rarity = "Common",
                edition = "e_negative",
                key_append = "gstpst_postaldude"
              }
            end
            return true
          end
        }))
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      if not from_debuff then
        play_sound("gstpst_postaldude_add", 1, 0.8)
      end
    end
  })
end

if not next(SMODS.find_mod("ColdBeans")) then --President Hathaway, Chuck McGill, Charles, Miracle Machine
  SMODS.Joker({
    key = "presidenthathaway",
    config = { extra = { xmult = 2 } },
    rarity = 3,
    atlas = "Jokers1",
    pos = { x = 9, y = 0 },
    cost = 10,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if
          context.individual
          and context.cardarea == G.play
          and context.other_card:get_id() == 13
          and context.other_card:is_suit("Spades")
      then
        return { xmult = card.ability.extra.xmult }
      end
    end,
    remove_from_deck = function(self, card, from_debuff)
      if not from_debuff and not G.CONTROLLER.locks.selling_card then
        G.STATE = G.STATES.GAME_OVER
        if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
          G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
        end
        G:save_settings()
        G.FILE_HANDLER.force = true
        G.STATE_COMPLETE = false
        G.SETTINGS.paused = false
        return
      end
    end,
  })


  SMODS.Sound({
    key = "chicanery",
    path = "gstpst_chicanery.ogg",
  })

  SMODS.Joker({
    key = "chuckmcgill",
    config = { extra = { xmult = 3 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 10, y = 0 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult,
          (
            G.GAME
            and G.GAME.current_round
            and G.GAME.current_round.hands_played ~= 0
            and G.GAME.last_hand_played
          )
          and localize(G.GAME.last_hand_played, "poker_hands")
          or localize("k_gstpst_unknown"),
        },
      }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.joker_main then
        local is_valid = context.scoring_name ~= card.ability.extra.prev_hand
        card.ability.extra.prev_hand = context.scoring_name
        if is_valid then
          if not card.ability.extra.chicanery then
            card.ability.extra.chicanery = true
            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound("gstpst_chicanery", 1, 0.7)
                return true
              end
            }))
          end
          return { xmult = card.ability.extra.xmult }
        end
      end
    end,
  })





  SMODS.Sound({
    key = "greatest_plan",
    path = "gstpst_greatest_plan.ogg"
  })

  SMODS.Joker({
    key = "charles",
    config = { extra = { money = 20 } },
    rarity = 3,
    atlas = "Jokers1",
    pos = { x = 0, y = 7 },
    flipbook_anim_states = {
      ["normal"] = {
        anim = {
          { x = 0, y = 7, t = 1 },
        },
        loop = false,
      },
      ["happening"] = {
        anim = {
          { x = 1,                             y = 7, t = 1.8 + (0.94 / 2) },
          { xrange = { first = 2, last = 11 }, y = 7, t = (0.94 / 2) / 18 },
          { xrange = { first = 0, last = 7 },  y = 8, t = (0.94 / 2) / 18 }
        },
        loop = false,
      },
    },
    flipbook_anim_initial_state = "normal",
    cost = 8,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.end_of_round and context.game_over and context.main_eval then
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("gstpst_greatest_plan", 1, 1)
            card:flipbook_set_anim_state("happening")
            return true
          end,
        }))
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          timer = "REAL",
          delay = 2.74,
          func = function()
            local me
            for i = 1, #G.jokers.cards do
              if G.jokers.cards[i] == card then
                me = i
              end
            end

            if me and me >= 1 and me <= #G.jokers.cards then
              local marked = G.jokers.cards[me - 1]
                  and G.jokers.cards[me + 1]
                  and (pseudorandom("gstpst_charles", 1, 2) == 1 and G.jokers.cards[me - 1] or G.jokers.cards[me + 1])
                  or G.jokers.cards[me - 1]
                  or G.jokers.cards[me + 1]

              if marked then
                marked:start_dissolve()
              end
            end

            G.hand_text_area.blind_chips:juice_up()
            G.hand_text_area.game_chips:juice_up()
            play_sound("tarot1")
            return true
          end,
        }))
        G.E_MANAGER:add_event(Event({
          func = function()
            card:start_dissolve()
            return true
          end,
        }))
        return { saved = "ph_gstpst_charles", dollars = card.ability.extra.money }
      end
    end,
  })

  SMODS.Joker({
    key = "miraclemachine",
    config = { extra = { money = 1 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 4, y = 6 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        if (
              context.other_card:get_id() <= 10
              and context.other_card:get_id() >= 0
              and context.other_card:get_id() % 2 == 1
            ) or (context.other_card:get_id() == 14)
        then
          return { dollars = card.ability.extra.money }
        end
      end
    end,
  })
end

do --Joker Kitchen / Crazy Hamburger
  SMODS.Atlas {
    key = "JokerKitchen",
    path = "GhostpostingJokerKitchen.png",
    px = 71,
    py = 95
  }

  SMODS.Sound({
    key = "jokerkitchen_intro",
    path = "gstpst_jokerkitchen_intro.ogg"
  })

  SMODS.Sound({
    key = "jokerkitchen_horsemeat",
    path = "gstpst_jokerkitchen_horsemeat.ogg"
  })

  SMODS.Sound({
    key = "jokerkitchen_redhotchilipeppers",
    path = "gstpst_jokerkitchen_redhotchilipeppers.ogg"
  })

  SMODS.Sound({
    key = "jokerkitchen_grassofdeath",
    path = "gstpst_jokerkitchen_grassofdeath.ogg"
  })

  SMODS.Sound({
    key = "jokerkitchen_oilfromiraq",
    path = "gstpst_jokerkitchen_oilfromiraq.ogg"
  })

  SMODS.Sound({
    key = "jokerkitchen_cheesefromsaopaulofrombrazil",
    path = "gstpst_jokerkitchen_cheesefromsaopaulofrombrazil.ogg"
  })

  SMODS.Sound({
    key = "jokerkitchen_breadmadeinturkey",
    path = "gstpst_jokerkitchen_breadmadeinturkey.ogg"
  })

  for i = 1, 7 do
    SMODS.Sound({
      key = "crazyhamburger-0" .. i,
      path = "gstpst_crazyhamburger-0" .. i .. ".ogg"
    })
  end

  SMODS.Joker({
    key = "jokerkitchen",
    config = { extra = { used_so_far = {} } },
    rarity = 2,
    atlas = "JokerKitchen",
    pos = { x = 0, y = 0 },
    flipbook_anim_states = {
      passive = {
        anim = {
          { xrange = { first = 0, last = 8 }, yrange = { first = 0, last = 1 }, t = 0.1 },
          { x = 0,                            y = 2,                            t = 0.1 }
        },
        loop = true
      },
      horsemeat = {
        anim = {
          { xrange = { first = 1, last = 8 }, y = 2, t = 0.1 },
          { xrange = { first = 0, last = 8 }, y = 3, t = 0.1 },
          { xrange = { first = 0, last = 4 }, y = 4, t = 0.1 },
        },
        loop = false,
        continuation = "passive"
      },
      redhotchilipeppers = {
        anim = {
          { xrange = { first = 5, last = 8 }, y = 4,                            t = 0.1 },
          { xrange = { first = 0, last = 8 }, yrange = { first = 5, last = 6 }, t = 0.1 },
          { xrange = { first = 0, last = 2 }, y = 7,                            t = 0.1 },
        },
        loop = false,
        continuation = "passive"
      },
      grassofdeath = {
        anim = {
          { xrange = { first = 3, last = 8 },  y = 7,                            t = 0.1 },
          { xrange = { first = 9, last = 17 }, yrange = { first = 0, last = 1 }, t = 0.1 },
        },
        loop = false,
        continuation = "passive"
      },
      oilfromiraq = {
        anim = {
          { xrange = { first = 9, last = 17 }, yrange = { first = 2, last = 3 }, t = 0.1 },
          { xrange = { first = 9, last = 11 }, y = 4,                            t = 0.1 },
        },
        loop = false,
        continuation = "passive"
      },
      cheesefromsaopaulofrombrazil = {
        anim = {
          { xrange = { first = 12, last = 17 }, y = 4,                            t = 0.1 },
          { xrange = { first = 9, last = 17 },  yrange = { first = 5, last = 7 }, t = 0.1 },
          { xrange = { first = 18, last = 26 }, y = 0,                            t = 0.1 },
        },
        loop = false,
        continuation = "passive"
      },
      breadmadeinturkey = {
        anim = {
          { xrange = { first = 18, last = 26 }, yrange = { first = 1, last = 3 }, t = 0.1 },
          { xrange = { first = 18, last = 22 }, y = 4,                            t = 0.1 },
        },
        loop = false,
        continuation = "passive"
      }
    },
    flipbook_anim_initial_state = "passive",
    cost = 7,
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.j_gstpst_crazyhamburger
      local count = 0
      for _, v in pairs(card.ability.extra.used_so_far) do
        count = count + 1
      end
      return { vars = { count } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.using_consumeable and not context.blueprint then
        local key
        if context.consumeable.config.center.key == "c_gstpst_horsemeat" then
          key = "horsemeat"
        elseif context.consumeable.config.center.key == "c_gstpst_redhotchilipeppers" then
          key = "redhotchilipeppers"
        elseif context.consumeable.config.center.key == "c_gstpst_grassofdeath" then
          key = "grassofdeath"
        elseif context.consumeable.config.center.key == "c_gstpst_oilfromiraq" then
          key = "oilfromiraq"
        elseif context.consumeable.config.center.key == "c_gstpst_cheesefromsaopaulofrombrazil" then
          key = "cheesefromsaopaulofrombrazil"
        elseif context.consumeable.config.center.key == "c_gstpst_breadmadeinturkey" then
          key = "breadmadeinturkey"
        else
          return
        end

        card.ability.extra.used_so_far[key] = true

        local count = 0
        for _, v in pairs(card.ability.extra.used_so_far) do
          count = count + 1
        end
        if count >= 6 then
          local become_crazy = function(params)
            local card = params.card
            card:set_ability("j_gstpst_crazyhamburger")
            card.flipbook_anim_t = 0
            card.flipbook_anim = format_flipbook_anim(card.config.center.flipbook_anim)
            play_sound("gstpst_crazyhamburger-0" .. math.random(7), 1, 0.8)
          end

          gstpst_flip_card_and_do(card, become_crazy, { card = card })
        else
          G.E_MANAGER:add_event(Event({
            func = function()
              card:flipbook_set_anim_state(key)
              play_sound("gstpst_jokerkitchen_" .. key, 1, 0.8)
              return true
            end
          }))
        end
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      play_sound("gstpst_jokerkitchen_intro", 1, 0.8)
    end
  })

  SMODS.Joker({
    key = "crazyhamburger",
    config = { extra = { added_xmult = 0.5, current_xmult = 1 } },
    rarity = 4,
    atlas = "JokerKitchen",
    pos = { x = 23, y = 4 },
    flipbook_anim = {
      { xrange = { first = 23, last = 26 }, y = 4,                            t = 0.1 },
      { xrange = { first = 18, last = 26 }, yrange = { first = 5, last = 7 }, t = 0.1 }
    },
    cost = 20,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.added_xmult, card.ability.extra.current_xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.joker_main and card.ability.extra.current_xmult > 1 then
        return { xmult = card.ability.extra.current_xmult }
      end

      if context.before and not context.blueprint and (context.scoring_name == "Straight" or G.GAME.hands[context.scoring_name].order < G.GAME.hands["Straight"].order) then
        card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
        return { message = localize("k_upgrade_ex") }
      end

      if context.individual and context.cardarea == G.play then
        local _card = context.other_card
        G.E_MANAGER:add_event(Event({
          trigger = "before",
          delay = 0.4,
          func = function()
            _card:flip(); play_sound("card1", 1); card:juice_up(); _card:juice_up(0.3, 0.3); return true
          end
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
          trigger = "before",
          delay = 0.2,
          func = function()
            local selectable_suits = {}
            for k, v in pairs(SMODS.Suits) do
              if k ~= _card.base.suit then
                selectable_suits[k] = v
              end
            end
            selectable_suits[_card.base.suit] = nil
            local chosen_suit = (pseudorandom_element(selectable_suits, pseudoseed("crazyhamburgersuit")) or { key = "Spades" })
                .key

            local selectable_ranks = {}
            for k, v in pairs(SMODS.Ranks) do
              if k ~= _card.base.id then
                selectable_ranks[k] = v
              end
            end
            selectable_ranks[_card.base.id] = nil
            local chosen_rank = (pseudorandom_element(selectable_ranks, pseudoseed("crazyhamburgerrank")) or { key = "Ace" })
                .key

            SMODS.change_base(_card, chosen_suit, chosen_rank)
            return true
          end
        }))
        G.E_MANAGER:add_event(Event({
          trigger = "before",
          delay = 0.1,
          func = function()
            _card:flip()
            play_sound("tarot2", 1, 0.6)
            return true
          end
        }))
      end
    end,
    in_pool = function()
      return false
    end
  })
end

if not next(SMODS.find_mod("ColdBeans")) then --Green / Blue Matador, Bozo Brain, The Last Supper, Pipeline Punch, Intentionally Blank, Zirconium Pants
  SMODS.Joker({
    key = "greenmatador",
    config = { extra = { current_money = 0, added_money = 1 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 6, y = 6 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.current_money, card.ability.extra.added_money } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_they",

    calculate = function(self, card, context)
      if
          context.end_of_round
          and context.cardarea == G.jokers
          and G.GAME.blind and G.GAME.blind:get_type() == "Boss"
          and not context.blueprint
      then
        if G.GAME.current_round.discards_left > 0 then
          card.ability.extra.current_money = card.ability.extra.current_money
              + (card.ability.extra.added_money * G.GAME.current_round.discards_left)
          return { message = localize("k_upgrade_ex") }
        end
      end
    end,
    calc_dollar_bonus = function(self, card)
      if card.ability.extra.current_money > 0 then
        return card.ability.extra.current_money
      end
    end,
  })

  SMODS.Joker({
    key = "bluematador",
    config = { extra = { current_money = 0, added_money = 1 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 7, y = 6 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.current_money, card.ability.extra.added_money } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_they",

    calculate = function(self, card, context)
      if
          context.end_of_round
          and context.cardarea == G.jokers
          and G.GAME.blind and G.GAME.blind:get_type() == "Boss"
          and not context.blueprint
      then
        if G.GAME.current_round.hands_left > 0 then
          card.ability.extra.current_money = card.ability.extra.current_money
              + (card.ability.extra.added_money * G.GAME.current_round.hands_left)
          return { message = localize("k_upgrade_ex") }
        end
      end
    end,
    calc_dollar_bonus = function(self, card)
      if card.ability.extra.current_money > 0 then
        return card.ability.extra.current_money
      end
    end,
  })

  SMODS.Joker({
    key = "bozobrain",
    config = { extra = { money = 2 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 9, y = 6 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    calculate = function(self, card, context)
      if context.before and to_number(G.GAME.hands[context.scoring_name].level) == 1 then
        return { dollars = card.ability.extra.money }
      end
    end,
  })



  function last_supper_count_faces()
    local cards = {}
    if G.playing_cards then
      for i = 1, #G.playing_cards do
        if not SMODS.has_no_rank(G.playing_cards[i]) and G.playing_cards[i]:is_face() then
          cards[#cards + 1] = G.playing_cards[i]
        end
      end
    end
    return #cards
  end

  SMODS.Joker({
    key = "thelastsupper",
    config = { extra = { xmult = 3, faces = 12 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 11, y = 0 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult,
          card.ability.extra.faces,
          last_supper_count_faces(),
          last_supper_count_faces() == card.ability.extra.faces and localize("k_gstpst_active")
          or localize("k_gstpst_inactive"),
        },
      }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    calculate = function(self, card, context)
      if context.joker_main and last_supper_count_faces() == card.ability.extra.faces then
        return { xmult = card.ability.extra.xmult }
      end
    end,
  })

  SMODS.Joker({
    key = "pipelinepunch",
    config = { extra = { hands_left = 10, odds = 2 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 0, y = 1 },
    flipbook_anim = {
      { xrange = { first = 0, last = 9 },   y = 1, t = 0.1 },
      { x = 0,                              y = 1, t = 0.1 },
      { xrange = { first = 10, last = 11 }, y = 1, t = 0.1 },
      { xrange = { first = 0, last = 6 },   y = 2, t = 0.1 },
    },
    flipbook_pos_extra = { x = 7, y = 2 },
    flipbook_anim_extra = {
      { x = 7,  y = 2, t = 0.075 },
      { x = 8,  y = 2, t = 0.125 },
      { x = 9,  y = 2, t = 0.175 },
      { x = 10, y = 2, t = 0.3 },
      { x = 9,  y = 2, t = 0.175 },
      { x = 8,  y = 2, t = 0.125 },
      { x = 7,  y = 2, t = 0.075 },
      { x = 11, y = 2, t = 0.125 },
      { x = 0,  y = 3, t = 0.175 },
      { x = 1,  y = 3, t = 0.3 },
      { x = 0,  y = 3, t = 0.175 },
      { x = 11, y = 2, t = 0.125 },
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "pipelinepunch")
      return { vars = { card.ability.extra.hands_left, num, denom } }
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "she_her",
    pools = { ["Food"] = true },

    calculate = function(self, card, context)
      if context.before and SMODS.pseudorandom_probability(card, "pipelinepunch", 1, card.ability.extra.odds) then
        local _card = context.scoring_hand[1]
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("tarot1")
            card:juice_up()
            return true
          end,
        }))
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 0.15,
          func = function()
            _card:flip()
            play_sound("card1", 1)
            _card:juice_up(0.3, 0.3)
            return true
          end,
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
          delay = 0.1,
          func = function()
            assert(SMODS.change_base(_card, nil, "Queen"))
            return true
          end,
        }))
        G.E_MANAGER:add_event(Event({
          delay = 0.1,
          func = function()
            _card:flip()
            play_sound("tarot2", 1)
            _card:juice_up(0.3, 0.3)
            return true
          end,
        }))
        delay(0.2)
      end

      if context.after and not context.blueprint then
        if card.ability.extra.hands_left - 1 <= 0 then
          SMODS.destroy_cards(card, nil, nil, true)
          return {
            message = localize("k_drank_ex"),
            colour = G.C.FILTER,
          }
        else
          card.ability.extra.hands_left = card.ability.extra.hands_left - 1
          return {
            message = card.ability.extra.hands_left .. "",
            colour = G.C.FILTER,
          }
        end
      end
    end,
  })

  SMODS.Joker({
    key = "intentionallyblank",
    config = { extra = { xmult = 1.3 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 2, y = 3 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.other_joker then
        local me
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i] == card then
            me = i
          end
        end

        if context.other_joker == G.jokers.cards[me - 1] or context.other_joker == G.jokers.cards[me + 1] then
          return { xmult = card.ability.extra.xmult }
        end
      end
    end,
  })

  SMODS.Joker({
    key = "zirconiumpants",
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 5, y = 6 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
      return {}
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    calculate = function(self, card, context)
      if context.before and next(context.poker_hands["Two Pair"]) then
        local candidates = {}
        for _, v in ipairs(G.hand.cards) do
          if not next(SMODS.get_enhancements(v)) then
            candidates[#candidates + 1] = v
          end
        end

        if next(candidates) then
          local _card = pseudorandom_element(candidates, pseudoseed("zirconiumpants"))
          G.E_MANAGER:add_event(Event({
            func = function()
              _card:set_ability("m_steel")
              _card:juice_up()
              return true
            end,
          }))
          return {
            message = localize({ key = "m_steel", type = "name_text", set = "Enhanced" }),
            colour = G.C.FILTER,
          }
        end
      end
    end,
  })
end

do --Cadonk
  SMODS.Joker({
    key = "cadonk",
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 0, y = 0 },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.after and not context.blueprint then
        if not card.ability.extra then card.ability.extra = {} end
        card.ability.extra.hand_mapping = {}

        for k, v in pairs(G.GAME.hands) do
          local valid_hands = {}
          for kk, vv in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(kk) and v.order > vv.order then
              valid_hands[#valid_hands + 1] = kk
            end
          end
          if #valid_hands > 0 then
            local chosen_hand = pseudorandom_element(valid_hands, pseudoseed("cadonk_" .. k))
            card.ability.extra.hand_mapping[k] = chosen_hand
          end
        end
      end

      if context.evaluate_poker_hand and card.ability.extra.hand_mapping[context.scoring_name] and not context.blueprint then
        return { replace_scoring_name = card.ability.extra.hand_mapping[context.scoring_name] }
      end
    end,
    set_ability = function(self, card, initial, delay_sprites)
      if not card.ability then card.ability = {} end
      if not card.ability.extra then card.ability.extra = {} end
      card.ability.extra.hand_mapping = {}

      for k, v in pairs(G.GAME.hands) do
        local valid_hands = {}
        for kk, vv in pairs(G.GAME.hands) do
          if SMODS.is_poker_hand_visible(kk) and v.order > vv.order then
            valid_hands[#valid_hands + 1] = kk
          end
        end
        if #valid_hands > 0 then
          local chosen_hand = pseudorandom_element(valid_hands, pseudoseed("cadonk_" .. k))
          card.ability.extra.hand_mapping[k] = chosen_hand
        end
      end
    end
  })
end

do --Person McDudeguy, Demon McEvilmonster
  SMODS.Joker({
    key = "personmcdudeguy",
    no_pool_flag = "personmcdudeguy_sold",
    config = { extra = { money = 1 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 1, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    calculate = function(self, card, context)
      if context.before or context.pre_discard then
        return { dollars = card.ability.extra.money }
      end

      if context.selling_self and not context.blueprint then
        G.GAME.pool_flags.personmcdudeguy_sold = true
      end
    end
  })

  SMODS.Joker({
    key = "demonmcevilmonster",
    yes_pool_flag = "personmcdudeguy_sold",
    config = { extra = { xmult = 3, money = 1 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 2, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money, card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.pre_discard then
        return { dollars = -card.ability.extra.money }
      end

      if context.joker_main then
        return { xmult = card.ability.extra.xmult }
      end
    end
  })
end

if not next(SMODS.find_mod("ColdBeans")) then --Man Face, Splash Man, Face
  SMODS.Sound({
    key = "bwow",
    path = "gstpst_bwow.ogg",
  })

  SMODS.Joker({
    key = "manface",
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 8, y = 0 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = { key = "gstpst_man", set = "Other", vars = {} }
      return {}
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
      if context.first_hand_drawn then
        local candidates = {}
        for i = 1, #G.hand.cards do
          if not (G.hand.cards[i].ability and G.hand.cards[i].ability.gstpst_man) then
            candidates[#candidates + 1] = G.hand.cards[i]
          end
        end
        if #candidates > 0 then
          local chosen_card = pseudorandom_element(candidates, pseudoseed("manface"))
          chosen_card:add_sticker("gstpst_man", true)
          card:juice_up()
          play_sound("gstpst_bwow", 1, 0.7)
          return { message = localize("gstpst_man", "labels"), colour = G.C.FILTER }
        end
      end
    end,
    pronouns = "he_him",
  })

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

  SMODS.Joker({
    key = "splashman",
    config = { extra = { xmult = 1.1 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 8, y = 6 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    calculate = function(self, card, context)
      if context.modify_scoring_hand and not context.blueprint then
        return { add_to_hand = true }
      end

      if context.individual and not context.repetition and context.cardarea == G.play then
        return { xmult = card.ability.extra.xmult }
      end
    end
  })

  SMODS.Joker({
    key = "face",
    config = { extra = { xmult = 1.2 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 0, y = 9 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    calculate = function(self, card, context)
      if context.individual and not context.repetition and context.cardarea == G.play and context.other_card:is_face() then
        return { xmult = card.ability.extra.xmult }
      end
    end,
  })
end

do --Boris
  G.gstpst_borisUIX, G.gstpst_borisUIY = 236, 397
  SMODS.Atlas {
    key = "BorisUI",
    path = "Boris.png",
    px = G.gstpst_borisUIX,
    py = G.gstpst_borisUIY
  }

  SMODS.Sound({
    key = "boris_grounded",
    path = "gstpst_boris_grounded.ogg"
  })

  SMODS.Joker({
    key = "boris",
    config = { extra = { no_of_ranks = 3, ranks = {} } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 4, y = 0 },
    flipbook_anim_states = {
      passive = {
        anim = { { x = 4, y = 0, t = 1 } }, loop = false
      },
      angry = {
        anim = { { x = 5, y = 0, t = 5.5 } }, loop = false, continuation = "passive"
      }
    },
    flipbook_anim_initial_state = "passive",
    cost = 7,
    loc_vars = function(self, info_queue, card)
      local ranks_concat = ""
      for i = 1, card.ability.extra.no_of_ranks do
        if card.ability.extra.ranks[i] and card.ability.extra.ranks[i] > 1 then
          ranks_concat = ranks_concat .. localize(SMODS.Rank.obj_buffer[card.ability.extra.ranks[i] - 1], "ranks")
        else
          ranks_concat = ranks_concat .. localize("k_none")
        end
        if i < card.ability.extra.no_of_ranks then
          ranks_concat = ranks_concat .. ", "
        end
      end

      return {
        vars = {
          card.ability.extra.no_of_ranks, ranks_concat
        }
      }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him"
  })

  -- Thanks, All in Jest, for this code ^u^
  local shuffle_ref = CardArea.shuffle
  function CardArea:shuffle(_seed)
    local ref = shuffle_ref(self, _seed)

    if next(SMODS.find_card("j_gstpst_boris")) then
      local all_ranks = {}

      for _, v in ipairs(SMODS.find_card("j_gstpst_boris")) do
        for i = 1, v.ability.extra.no_of_ranks do
          if v.ability.extra.ranks[i] and v.ability.extra.ranks[i] > 1 then
            local found_rank = SMODS.Rank.obj_buffer[v.ability.extra.ranks[i] - 1]
            if found_rank then all_ranks[#all_ranks + 1] = found_rank end
          end
        end
      end

      local found_cards = {}

      for i = #self.cards, 1, -1 do
        local card = self.cards[i]

        for _, v in ipairs(all_ranks) do
          if card.base.value == v then
            table.insert(found_cards, card)
            table.remove(self.cards, i)
            break
          end
        end
      end

      for _, card in ipairs(found_cards) do
        table.insert(self.cards, 1, card)
      end
    end

    return ref
  end

  G.FUNCS.gstpst_run_boris_menu = function(e)
    G.SETTINGS.paused = true
    G.GAME.gstpst_current_boris_card = e.config.ref_table
    G.FUNCS.overlay_menu {
      definition = gstpst_create_boris_more_menu(e)
    }
  end

  G.FUNCS.gstpst_can_run_boris_menu = function(e)

  end

  function gstpst_create_boris_more_menu(e)
    local all_ranks_localised = { localize("k_none") }
    for _, v in ipairs(SMODS.Rank.obj_buffer) do
      all_ranks_localised[#all_ranks_localised + 1] = localize(v, "ranks")
    end

    local cycles = {}

    for i = 1, G.GAME.gstpst_current_boris_card.ability.extra.no_of_ranks do
      G.GAME.gstpst_current_boris_card.ability.extra.ranks[i] = G.GAME.gstpst_current_boris_card.ability.extra.ranks[i] or
          1

      cycles[#cycles + 1] =
      {
        n = G.UIT.R,
        config = { align = "cm", padding = 0 },
        nodes = {
          SMODS.GUI.dropdown_select({
            options = all_ranks_localised,
            minw = 2,
            max_menu_h = 2.5,
            callback = "gstpst_boris_change_rank",
            is_option_disabled = function(option)
              if option == all_ranks_localised[1] then return false end
              for index, r in ipairs(G.GAME.gstpst_current_boris_card.ability.extra.ranks) do
                if option == all_ranks_localised[r] and i ~= index then
                  return true
                end
              end
            end,
            ref_table = {},
            ref_value = "",
            default = all_ranks_localised[G.GAME.gstpst_current_boris_card.ability.extra.ranks[i]],
            rank_index = i,
            loc_ranks = all_ranks_localised,
            option_align = "cm",
            close_on_select = true,
          }),
          -- create_option_cycle({
          --   id = "gstpst_boris_cycle_" .. i,
          --   label = localize("b_boris_rank") .. " " .. i,
          --   scale = 0.8,
          --   options = all_ranks_localised,
          --   opt_callback = "gstpst_boris_change_rank",
          --   current_option = G.GAME.gstpst_current_boris_card.ability.extra.ranks[i]
          -- })
        }
      }
    end

    local boris_sprite = SMODS.create_sprite(0, 0, G.gstpst_borisUIX / 100, G.gstpst_borisUIY / 100, "gstpst_BorisUI",
      { x = 0, y = 0 })

    local t = create_UIBox_generic_options({
      back_func = "gstpst_leave_boris_more_menu",
      infotip = localize { type = "variable", key = "gstpst_boris_more_tooltip", vars = { G.GAME.gstpst_current_boris_card.ability.extra.no_of_ranks } },
      contents = {
        {
          n = G.UIT.C,
          config = { align = "cm", padding = 0 },
          nodes = {
            {
              n = G.UIT.R,
              config = { align = "cm", padding = 0.2 },
              nodes = {
                {
                  n = G.UIT.T,
                  config = { text = localize("k_gstpst_boris_menu_title"), colour = G.C.TEXT_LIGHT, scale = 0.9 }
                }
              }
            },
            {
              n = G.UIT.R,
              config = { align = "cm", padding = 0 },
              nodes = {
                {
                  n = G.UIT.C,
                  config = { align = "cm", padding = 0.1 },
                  nodes = cycles
                },
                {
                  n = G.UIT.C,
                  config = { align = "cm", padding = 0.1 },
                  nodes = {
                    {
                      n = G.UIT.O,
                      config = { object = boris_sprite }
                    }
                  }
                }
              }
            }
          }
        }
      }
    })
    return t
  end

  G.FUNCS.gstpst_boris_change_rank = function(args)
    for i = 1, G.GAME.gstpst_current_boris_card.ability.extra.no_of_ranks do
      if args.config.args_table.rank_index == i then
        local all_ranks = args.config.args_table.loc_ranks
        local target_index = 1
        for j, r in ipairs(all_ranks) do
          if args.config.value == r then
            target_index = j
          end
        end
        G.GAME.gstpst_current_boris_card.ability.extra.ranks[i] = target_index
      end
    end
    --
  end

  G.FUNCS.gstpst_leave_boris_more_menu = function(e)
    if G.OVERLAY_MENU then G.FUNCS.exit_overlay_menu() end
    G.SETTINGS.paused = false

    G.GAME.gstpst_current_boris_card:flipbook_set_anim_state("angry")
    play_sound("gstpst_boris_grounded", 1, 0.9)
    G.GAME.gstpst_current_boris_card = nil
  end

  local controllerkpuref = Controller.key_press_update
  function Controller:key_press_update(key, dt)
    if key == "escape" and G.SETTINGS.paused and G.GAME.gstpst_current_boris_card then
      G.FUNCS.gstpst_leave_boris_more_menu()
    end
    return controllerkpuref(self, key, dt)
  end
end

do --Jimbo
  SMODS.Sound({
    key = "jimbo",
    path = "gstpst_jimbo.ogg"
  })

  local gstpst_jimbo_curse_check = function(card)
    return card.ability.extra.bad_ability == "bad6" and SMODS.pseudorandom_probability(card, "gstpst_jimbo_curse", card.ability.extra.curse_num, card.ability.extra.curse_denom)
  end

  SMODS.Joker({
    key = "jimbo",
    config = { extra = {} },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 1, y = 10 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
      if (card.area and card.area.config.collection) or card.fake_card then
        return { vars = { "collection" } }
      else
        info_queue[#info_queue + 1] = G.P_CENTERS.j_gstpst_jimbo
        local vars_table = { card.ability.extra.good_ability_1, card.ability.extra.good_ability_2, card.ability.extra.bad_ability }

        if card.ability.extra.good_ability_1 == "good1" then
          vars_table[4] = { card.ability.extra.hand_size }
        elseif card.ability.extra.good_ability_1 == "good2" then
          vars_table[4] = { card.ability.extra.hands }
        elseif card.ability.extra.good_ability_1 == "good3" then
          vars_table[4] = { card.ability.extra.discards }
        elseif card.ability.extra.good_ability_1 == "good4" then
          vars_table[4] = { card.ability.extra.passive_income }
        elseif card.ability.extra.good_ability_1 == "good5" then
          vars_table[4] = { card.ability.extra.mult }
        elseif card.ability.extra.good_ability_1 == "good6" then
          vars_table[4] = { card.ability.extra.xmult == 1.666 and card.ability.extra.xmult .. "" or card.ability.extra.xmult }
        elseif card.ability.extra.good_ability_1 == "good7" then
          vars_table[4] = { card.ability.extra.chips }
        end

        if card.ability.extra.good_ability_2 == "good8" then
          vars_table[5] = { card.ability.extra.suit_money, localize(card.ability.extra.money_suit, "suits_plural") }
          vars_table[5].colours = { G.C.SUITS[card.ability.extra.suit] }
          --elseif card.ability.extra.good_ability_2 == "good9" then
          --elseif card.ability.extra.good_ability_2 == "good10" then
          --elseif card.ability.extra.good_ability_2 == "good11" then
        elseif card.ability.extra.good_ability_2 == "good12" then
          vars_table[5] = { card.ability.extra.freerolls }
        elseif card.ability.extra.good_ability_2 == "good13" then
          vars_table[5] = { card.ability.extra.moon_money }
        elseif card.ability.extra.good_ability_2 == "good14" then
          vars_table[5] = { card.ability.extra.retrigger_max_cards }
        end

        if card.ability.extra.bad_ability == "bad1" then
          vars_table[6] = { card.ability.extra.m_hand_size }
        elseif card.ability.extra.bad_ability == "bad2" then
          vars_table[6] = { card.ability.extra.m_hands }
        elseif card.ability.extra.bad_ability == "bad3" then
          vars_table[6] = { card.ability.extra.m_discards }
        elseif card.ability.extra.bad_ability == "bad4" then
          vars_table[6] = { card.ability.extra.target_perishable, card.ability.extra.current_perishable }
        elseif card.ability.extra.bad_ability == "bad5" then
          vars_table[6] = { card.ability.extra.rental_cost }
        elseif card.ability.extra.bad_ability == "bad6" then
          local curse_num, curse_denom = SMODS.get_probability_vars(card, card.ability.extra.curse_num, card.ability.extra.curse_denom, "gstpst_jimbo_curse")
          vars_table[6] = { curse_num, curse_denom }
          --elseif card.ability.extra.bad_ability == "bad7" then
        elseif card.ability.extra.bad_ability == "bad8" then
          vars_table[6] = { card.ability.extra.right_xmult == 0.666 and card.ability.extra.right_xmult .. "" or card.ability.extra.right_xmult }
        end
        return { vars = vars_table }
      end
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "he_him",
    set_ability = function(self, card, initial, delay_sprites)
      local no_curse_1 = true
      local no_curse_2 = true
      local curse_present = true

      while (curse_present and no_curse_1 and no_curse_2) do
        card.ability.extra.good_ability_1 = "good" .. pseudorandom("gstpst_jimbo_good1", 1, 7)
        card.ability.extra.good_ability_2 = "good" .. pseudorandom("gstpst_jimbo_good2", 8, 14)
        card.ability.extra.bad_ability = "bad" .. pseudorandom("gstpst_jimbo_bad", 1, 8)

        no_curse_1 = false
        no_curse_2 = false
        curse_present = false
        if card.ability.extra.good_ability_1 == "good1" then
          no_curse_1 = true
          card.ability.extra.hand_size = 1
        elseif card.ability.extra.good_ability_1 == "good2" then
          no_curse_1 = true
          card.ability.extra.hands = 1
        elseif card.ability.extra.good_ability_1 == "good3" then
          no_curse_1 = true
          card.ability.extra.discards = 1
        elseif card.ability.extra.good_ability_1 == "good4" then
          card.ability.extra.passive_income = 4
        elseif card.ability.extra.good_ability_1 == "good5" then
          card.ability.extra.mult = 12
        elseif card.ability.extra.good_ability_1 == "good6" then
          card.ability.extra.xmult = 1.666
        elseif card.ability.extra.good_ability_1 == "good7" then
          card.ability.extra.chips = 100
        end

        if card.ability.extra.good_ability_2 == "good8" then
          card.ability.extra.suit_money = 1
          local suit_money_suits = { "Hearts", "Clubs", "Diamonds", "Spades" }
          card.ability.extra.money_suit = pseudorandom_element(suit_money_suits, "gstpst_jimbo_suit_money")
        elseif card.ability.extra.good_ability_2 == "good9" then
          no_curse_2 = true
        elseif card.ability.extra.good_ability_2 == "good10" then
          no_curse_2 = true
          --elseif card.ability.extra.good_ability_2 == "good11" then
        elseif card.ability.extra.good_ability_2 == "good12" then
          no_curse_2 = true
          card.ability.extra.freerolls = 1
        elseif card.ability.extra.good_ability_2 == "good13" then
          card.ability.extra.moon_money = 1
        elseif card.ability.extra.good_ability_2 == "good14" then
          card.ability.extra.retrigger_max_cards = 5
        end

        if card.ability.extra.bad_ability == "bad1" then
          card.ability.extra.m_hand_size = 1
        elseif card.ability.extra.bad_ability == "bad2" then
          card.ability.extra.m_hands = 1
        elseif card.ability.extra.bad_ability == "bad3" then
          card.ability.extra.m_discards = 1
        elseif card.ability.extra.bad_ability == "bad4" then
          card.ability.extra.target_perishable = 5
          card.ability.extra.current_perishable = card.ability.extra.target_perishable
        elseif card.ability.extra.bad_ability == "bad5" then
          card.ability.extra.rental_cost = 3
        elseif card.ability.extra.bad_ability == "bad6" then
          curse_present = true
          card.ability.extra.curse_num = 1
          card.ability.extra.curse_denom = 2
          --elseif card.ability.extra.bad_ability == "bad7" then
        elseif card.ability.extra.bad_ability == "bad8" then
          card.ability.extra.right_xmult = 0.666
        end
      end
    end,
    calculate = function(self, card, context)
      if context.joker_main and (card.ability.extra.mult or card.ability.extra.xmult or card.ability.extra.chips) then
        if not gstpst_jimbo_curse_check(card) then
          if card.ability.extra.mult then
            return { mult = card.ability.extra.mult }
          elseif card.ability.extra.xmult then
            return { xmult = card.ability.extra.xmult }
          elseif card.ability.extra.chips then
            return { chips = card.ability.extra.chips }
          end
        end
      end

      if context.modify_scoring_hand and card.ability.extra.bad_ability == "bad7" and not context.blueprint then
        if context.other_card == context.full_hand[1] then
          return { add_to_hand = true }
        else
          return { remove_from_hand = true }
        end
      end

      if context.repetition and context.cardarea == G.play and card.ability.extra.good_ability_2 == "good14"
          and #G.play.cards < card.ability.extra.retrigger_max_cards then
        if not gstpst_jimbo_curse_check(card) then
          return { repetitions = 1 }
        end
      end

      if context.other_joker and card.ability.extra.right_xmult and G.jokers.cards[#G.jokers.cards] == context.other_joker then
        return { xmult = card.ability.extra.right_xmult }
      end

      if context.discard and card.ability.extra.money_suit and context.other_card:is_suit(card.ability.extra.money_suit) then
        if not gstpst_jimbo_curse_check(card) then
          return { dollars = card.ability.extra.suit_money }
        end
      end

      if context.end_of_round and not context.repetition and not context.individual and not context.game_over then
        if card.ability.extra.current_perishable and not context.blueprint then
          card.ability.extra.current_perishable = card.ability.extra.current_perishable - 1
          if card.ability.extra.current_perishable <= 0 then
            G.E_MANAGER:add_event(Event({
              func = function()
                card:start_dissolve()
                return true
              end
            }))
          else
            return { message = localize { type = "variable", key = "a_remaining", vars = { card.ability.extra.current_perishable } } }
          end
        elseif card.ability.extra.rental_cost then
          return { dollars = -card.ability.extra.rental_cost }
        end
      end

      if context.end_of_round and context.game_over and context.main_eval and card.ability.extra.good_ability_2 == "good9" and not context.blueprint then
        if to_big(G.GAME.chips) / to_big(G.GAME.blind.chips) >= to_big(0.25) then -- juuuuuuuust in case something weird happens with amulet or talisman
          if not gstpst_jimbo_curse_check(card) then
            G.E_MANAGER:add_event(Event({
              func = function()
                G.hand_text_area.blind_chips:juice_up()
                G.hand_text_area.game_chips:juice_up()
                play_sound("tarot1")
                SMODS.destroy_cards(card, nil, true)
                return true
              end
            }))
            return {
              message = localize("k_saved_ex"),
              saved = "ph_gstpst_jimbo",
              colour = G.C.RED
            }
          end
        end
      end

      if context.mod_probability and not context.blueprint and context.identifier ~= "gstpst_jimbo_curse" then
        return { numerator = context.numerator * 2 }
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      play_sound("gstpst_jimbo", 1, 0.666)

      if not card.ability.extra.hand_size ~= not card.ability.extra.m_hand_size then
        G.hand:change_size(card.ability.extra.hand_size or -card.ability.extra.m_hand_size)
      end
      if not card.ability.extra.hands ~= not card.ability.extra.m_hands then
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + (card.ability.extra.hands or -card.ability.extra.m_hands)
        ease_hands_played(card.ability.extra.hands or -card.ability.extra.m_hands)
      end
        if not card.ability.extra.discards ~= not card.ability.extra.m_discards then
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + (card.ability.extra.discards or -card.ability.extra.m_discards)
        ease_discard(card.ability.extra.discards or -card.ability.extra.m_discards)
      end
      
      if card.ability.extra.good_ability_2 == "good11" and not gstpst_jimbo_curse_check(card) then
        G.E_MANAGER:add_event(Event({
          func = (function()
            card:set_edition("e_negative")
            return true
          end)
        }))
      end
      if card.ability.extra.freerolls then
        SMODS.change_free_rerolls(card.ability.extra.freerolls)
      end
      if card.ability.extra.moon_money then
        G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.moon_money
      end
    end,
    remove_from_deck = function(self, card, from_debuff)
      if not card.ability.extra.hand_size ~= not card.ability.extra.m_hand_size then
        G.hand:change_size(-(card.ability.extra.hand_size or -card.ability.extra.m_hand_size))
      end
      if not card.ability.extra.hands ~= not card.ability.extra.m_hands then
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - (card.ability.extra.hands or -card.ability.extra.m_hands)
        ease_hands_played(-(card.ability.extra.hands or -card.ability.extra.m_hands))
      end
      if not card.ability.extra.discards ~= not card.ability.extra.m_discards then
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - (card.ability.extra.discards or -card.ability.extra.m_discards)
        ease_discard(-(card.ability.extra.discards or -card.ability.extra.m_discards))
      end

      if card.ability.extra.freerolls then
        SMODS.change_free_rerolls(-card.ability.extra.freerolls)
      end
      if card.ability.extra.moon_money then
        G.GAME.interest_amount = G.GAME.interest_amount - card.ability.extra.moon_money
      end
    end,
    calc_dollar_bonus = function(self, card)
      if card.ability.extra.passive_income and not gstpst_jimbo_curse_check(card) then
        return card.ability.extra.passive_income
      end
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
      if not card then
        card = self:create_fake_card()
      end

      if desc_nodes == full_UI_table.main and not full_UI_table.name then
        full_UI_table.name = localize { type = "name", set = self.set, key = self.key, nodes = full_UI_table.name }
      elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
        desc_nodes.name = localize { type = "name_text", set = self.set, key = self.key }
        if (not full_UI_table.from_detailed_tooltip or full_UI_table.info[1] == desc_nodes)
            and not full_UI_table.no_styled_name then
          desc_nodes.name_styled = {}

          localize { type = "name", set = self.set, key = self.key, nodes = desc_nodes.name_styled, fixed_scale = 0.63, no_pop_in = true, no_shadow = true, y_offset = 0, no_spacing = true, no_bump = true }
          desc_nodes.name_styled = SMODS.info_queue_desc_from_rows(desc_nodes.name_styled, true)
          desc_nodes.name_styled.config.align = "cm"
        end
      end

      local vars = self.loc_vars and type(self.loc_vars) == "function" and self:loc_vars(info_queue, card).vars
      if specific_vars and specific_vars.debuffed then
        localize { type = "other", key = "debuffed_default", nodes = desc_nodes, AUT = full_UI_table }
      elseif vars[1] == "collection" then
        if not full_UI_table.info then full_UI_table.info = {} end
        localize { type = "descriptions", key = self.key, set = self.set, nodes = desc_nodes, vars = vars or {} }
      else
        full_UI_table.multi_box = full_UI_table.multi_box or { {}, {} }
        localize { type = "descriptions", key = self.key .. "_" .. vars[1], set = self.set, nodes = desc_nodes, vars = vars[4] or {} }
        desc_nodes.main_box_flag = true
        localize { type = "descriptions", key = self.key .. "_" .. vars[2], set = self.set, nodes = full_UI_table.multi_box[1], vars = vars[5] or {} }
        localize { type = "descriptions", key = self.key .. "_" .. vars[3], set = self.set, nodes = full_UI_table.multi_box[2], vars = vars[6] or {} }
      end
    end
  })
end

do --Cross
  -- Thanks, YMA from Cold Beans!
  function gstpst_change_blind_requirement(mod_add)
    if not G.GAME.blind.original_chips then G.GAME.blind.original_chips = G.GAME.blind.chips end
    local original_chips = G.GAME.blind.original_chips > 0 and G.GAME.blind.original_chips or G.GAME.blind.chips
    mod_add = mod_add or 0
    mod_add = -math.ceil(G.GAME.blind.chips * mod_add / 100)

    local current_mult = G.GAME.blind.chips / (original_chips / G.GAME.blind.mult)
    local final_chips = (original_chips / G.GAME.blind.mult) * (current_mult) + mod_add
    local chip_mod
    if type(G.GAME.blind.chips) ~= "table" then
      chip_mod = math.ceil(math.abs(final_chips - G.GAME.blind.chips) / 120)
    else
      chip_mod = ((final_chips - G.GAME.blind.chips):abs() / 120):ceil()
    end
    local step = 0
    if G.GAME.blind.chips < final_chips then
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        blocking = true,
        func = function()
          G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
          if G.GAME.blind.chips < final_chips then
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            if step % 5 == 0 then
              play_sound("chips1", 0.8 + (step * 0.005))
            end
            step = step + 1
          else
            G.GAME.blind.chips = final_chips
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:wiggle()
            return true
          end
        end
      }))
    else
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        blocking = true,
        func = function()
          G.GAME.blind.chips = G.GAME.blind.chips - G.SETTINGS.GAMESPEED * chip_mod
          if G.GAME.blind.chips > final_chips then
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            if step % 5 == 0 then
              play_sound("chips1", 0.8 + (step * 0.005))
            end
            step = step - 1
          else
            G.GAME.blind.chips = final_chips
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:wiggle()
            return true
          end
        end
      }))
    end
  end

  SMODS.Sound({
    key = "cross_reverse",
    path = "gstpst_cross_reverse.ogg"
  })

  SMODS.Sound({
    key = "cross_upright",
    path = "gstpst_cross_upright.ogg"
  })

  SMODS.Joker({
    key = "cross",
    config = { extra = { current_xmult = 1, added_xmult = 0.6, rotating_to = 0, rotating_from = 0, rotation_t = -1, current_rotation = 0 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 3, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.current_xmult, card.ability.extra.added_xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.setting_blind and not context.blueprint then
        card.ability.extra.rotating_from = card.ability.extra.rotating_to
        card.ability.extra.current_rotation = card.ability.extra.rotating_from
        card.ability.extra.rotating_to = card.ability.extra.rotating_to + 1
        card.ability.extra.rotation_t = 0

        if card.ability.extra.rotating_from == 1 then
          card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound("gstpst_cross_upright", 1, 0.8)
              return true
            end
          }))
          return { message = localize("k_upgrade_ex") }
        else
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound("gstpst_cross_reverse", 1, 0.8)
              gstpst_change_blind_requirement(-100)
              return true
            end
          }))
        end
      end

      if context.joker_main and card.ability.extra.current_xmult > 1 then
        return { xmult = card.ability.extra.current_xmult }
      end
    end,
    update = function(self, card, dt)
      if card.ability.extra.rotation_t < 0 then
        return
      end

      if card.ability.extra.rotation_t >= 1 then
        card.ability.extra.rotating_to = card.ability.extra.rotating_to % 2
        card.ability.extra.current_rotation = card.ability.extra.rotating_to
        card.ability.extra.rotating_from = -1
        card.ability.extra.rotation_t = -1
        return
      end

      card.ability.extra.rotation_t = card.ability.extra.rotation_t + (dt * 2)
      card.ability.extra.current_rotation = card.ability.extra.rotating_from + card.ability.extra.rotation_t
    end
  })

  -- Thanks to Bakery for this code.
  local set_sprites_ref = Card.set_sprites
  function Card:set_sprites(center, front)
    set_sprites_ref(self, center, front)
    if center == G.P_CENTERS.j_gstpst_cross and (center.discovered or self.params.bypass_discovery_center) then
      self.children.center.role.r_bond = "Weak"
      self.children.center.role.role_type = "Major"
      local t = self.T
      self.children.center.T = setmetatable({}, {
        __index = function(_, k)
          if k == "r" then
            return math.rad((self.ability and self.ability.extra.current_rotation or 0) * 180)
          end
          return t[k]
        end,
        __newindex = function(_, k, v)
          t[k] = v
        end
      })
    end
  end
end

do --Signed Egg
  SMODS.Joker({
    key = "signedegg",
    config = { extra = { price = 2 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 6, y = 0 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.price } }
    end,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
        card.ability.extra_value = card.ability.extra_value + card.ability.extra.price
        card:set_cost()
        return {
          message = localize("k_val_up"),
          colour = G.C.MONEY
        }
      end

      if context.selling_self and not context.blueprint and card.ability.extra_value > 0 then
        local me
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i] == card then
            me = i
            break
          end
        end

        if me and me > 1 and G.jokers.cards[me - 1] then
          local _card = G.jokers.cards[me - 1]
          _card.ability.extra_value = _card.ability.extra_value + card.ability.extra_value
          _card:set_cost()
          return {
            message = localize("k_val_up"),
            colour = G.C.MONEY,
            message_card = _card
          }
        end
      end
    end
  })
end

if not next(SMODS.find_mod("ColdBeans")) then --Traffic Light, Cacklejack, Better Credit Card
  SMODS.Joker({
    key = "theworldshardestjoker",
    config = { extra = { counted = 0, target = 3 } },
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 3, y = 3 },
    pos_extra = { x = 4, y = 3 },
    flipbook_anim_extra = {
      { xrange = { first = 4, last = 11 }, y = 3,                            t = 0.025 },
      { xrange = { first = 0, last = 11 }, yrange = { first = 4, last = 5 }, t = 0.025 },
      { xrange = { first = 0, last = 2 },  y = 6,                            t = 0.025 },
      { xrange = { first = 1, last = 0 },  y = 6,                            t = 0.025 },
      { xrange = { first = 11, last = 0 }, yrange = { first = 5, last = 4 }, t = 0.025 },
      { xrange = { first = 11, last = 4 }, y = 3,                            t = 0.025 },
      { x = 3,                             y = 6,                            t = 0.025 },
    },
    cost = 7,
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
      return { vars = { card.ability.extra.target, card.ability.extra.target - card.ability.extra.counted } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    calculate = function(self, card, context)
      if context.before and next(context.poker_hands["Straight Flush"]) then
        card.ability.extra.counted = card.ability.extra.counted + 1
        if card.ability.extra.counted >= card.ability.extra.target then
          card.ability.extra.counted = 0
          if count_consumables() < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
              trigger = "before",
              func = function()
                play_sound("timpani")
                local new_card = SMODS.add_card({
                  set = "Spectral",
                  area = G.consumeables,
                  key = "c_soul",
                })
                new_card:juice_up(0.3, 0.5)
                G.GAME.consumeable_buffer = 0
                return true
              end,
            }))
            return {
              message = localize("k_plus_soul"),
              colour = G.C.GREEN,
              message_card = card,
            }
          else
            return { message = localize("k_no_room_ex"), colour = G.RED }
          end
        else
          return { message = card.ability.extra.counted .. "/" .. card.ability.extra.target, colour = G.FILTER }
        end
      elseif context.before and card.ability.extra.counted > 0 then
        card.ability.extra.counted = 0
        return { message = localize("k_reset"), colour = G.RED }
      end
    end,
  })

  SMODS.Joker({
    key = "trafficlight",
    config = { extra = { xmult = 2 } },
    rarity = 3,
    atlas = "Jokers1",
    pos = { x = 8, y = 8 },
    flipbook_anim_states = {
      ["go"] = { anim = { { x = 8, y = 8, t = 15 } }, loop = false, continuation = "prepare" },
      ["prepare"] = { anim = { { x = 9, y = 8, t = 3 } }, loop = false, continuation = "stop" },
      ["stop"] = { anim = { { x = 10, y = 8, t = 15 } }, loop = false, continuation = "almost" },
      ["almost"] = { anim = { { x = 11, y = 8, t = 3 } }, loop = false, continuation = "go" },
    },
    flipbook_anim_initial_state = "go",
    cost = 8,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)
      if context.press_play and not context.blueprint then
        card.ability.extra.active = card.flipbook_anim_current_state == "go"
            or card.flipbook_anim_current_state == "prepare"
      end

      if context.joker_main and card.ability.extra.active then
        return { xmult = card.ability.extra.xmult }
      end
    end,
  })

  SMODS.Sound({
    key = "reroll_card",
    path = "gstpst_reroll_card.ogg"
  })

  function gstpst_reroll_card_except_cacklejack(card)
    local candidates = {}
    if not card then return end
    for k, v in pairs(G.P_CENTER_POOLS.Joker) do
      if
          v.rarity == (card.rarity or (card.config and card.config.center and card.config.center.rarity))
          and v.key ~= (card.key or (card.config and card.config.center and card.config.center.key) or "j_gstpst_cacklejack")
          and (not v.in_pool or v:in_pool())
      then
        candidates[#candidates + 1] = v.key
      end
    end

    card:juice_up()
    card:set_ability(pseudorandom_element(candidates))
  end

  SMODS.Joker({
    key = "cacklejack",
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 10, y = 6 },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    calculate = function(self, card, context)
      if context.end_of_round and not context.individual and not context.repetition and not context.game_over and not context.blueprint then
        local me
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i] == card then
            me = i
          end
        end

        if me and me >= 1 and me <= #G.jokers.cards then
          local candidates = {}
          for i, v in ipairs(G.jokers.cards) do
            if v and i > me and not (v.config and v.config.center and v.config.center.key == "j_gstpst_cacklejack") then
              candidates[#candidates + 1] = v
            end
          end

          if next(candidates) then
            G.E_MANAGER:add_event(Event({
              func = function()
                card:juice_up()
                local _card = pseudorandom_element(candidates, "cacklejack")
                play_sound("gstpst_reroll_card", 1, 0.2)
                gstpst_reroll_card_except_cacklejack(_card)
                return true
              end,
            }))
            return { message = localize("k_gstpst_replaced_ex"), colour = G.C.GREEN }
          end
        end
      end
    end,
  })
end


do --Faceless Zany Joker
  SMODS.Joker({
    key = "facelesszanyjoker",
    config = { extra = { money = 5 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 0, y = 10 },
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    calculate = function(self, card, context)
      if context.discard and context.other_card == context.full_hand[#context.full_hand] then
        if next(get_X_same(3, context.full_hand)) then
          G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
          return {
            dollars = card.ability.extra.money,
            delay = 0.45,
            func = function()
              G.E_MANAGER:add_event(Event({
                func = function()
                  G.GAME.dollar_buffer = 0
                  return true
                end
              }))
            end
          }
        end
      end
    end
  })
end

if next(SMODS.find_mod("ColdBeans")) then --Better Credit Card
  SMODS.Joker({
    key = "bettercreditcard",
    config = { extra = { bankrupt_at = 20 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.bankrupt_at } }
    end,
    rarity = 2,
    atlas = "Jokers1",
    pos = { x = 7, y = 0 },
    draw = function(self, card, layer)
      if self.discovered or card.params.bypass_discovery_center then
        card.children.center:draw_shader("booster", nil, card.ARGS.send_to_shader)
      end
    end,
    cost = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "it_its",

    add_to_deck = function(self, card, from_debuff)
      G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
      G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
      if not from_debuff then
        if G.GAME.dollars < 0 then
          G.E_MANAGER:add_event(Event({
            func = function()
              ease_dollars(-G.GAME.dollars)
              return true
            end
          }))
        end
      end
    end,
  })
end

do --One Armed Bandit
  SMODS.Atlas {
    key = "OneArmedBandit",
    path = "GhostpostingOneArmedBandit.png",
    px = 71,
    py = 95
  }

  SMODS.Sound({
    key = "bandit_play",
    path = "gstpst_bandit_play.ogg"
  })

  SMODS.Sound({
    key = "bandit_play_long",
    path = "gstpst_bandit_play_long.ogg"
  })

  SMODS.Sound({
    key = "bandit_jackpot",
    path = "gstpst_bandit_jackpot.ogg"
  })

  SMODS.Sound({
    key = "bandit_jackpot_miss",
    path = "gstpst_bandit_jackpot_miss.ogg"
  })

  SMODS.Sound({
    key = "bandit_line",
    path = "gstpst_bandit_line.ogg"
  })

  SMODS.Sound({
    key = "bandit_flush",
    path = "gstpst_bandit_flush.ogg"
  })

  SMODS.Sound({
    key = "bandit_bonus",
    path = "gstpst_bandit_bonus.ogg"
  })

  SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = "bandit_music",
    path = "gstpst_bandit_music.ogg",
    select_music_track = function()
      if #SMODS.find_card("j_gstpst_onearmedbandit") > 0 and not Ghostposting.config["custom_music_disabled"] then
        return 1e6
      end
      return false
    end
  })

  G.gstpst_onearmedbandit_reels = {
    reel_a = { "seven", "heart", "diamond", "club", "spade", "wild", "heart", "diamond", "club", "spade" },
    reel_b = { "seven", "diamond", "club", "spade", "heart", "wild", "diamond", "club", "spade", "heart" },
    reel_c = { "seven", "club", "spade", "heart", "diamond", "wild", "club", "spade", "heart", "diamond" },
    reel_bonus = { "seven", "spade", "heart", "diamond", "club" }
  }

  SMODS.Joker({
    key = "onearmedbandit",
    config = {
      extra = {
        spin_cost = 1,
        flush_prize = 2,
        line_prize = 5,
        jackpot_prize = 100,
        bonus_reel_prize = 1,
        reel_states = {
          reel_a = 1,
          reel_b = 1,
          reel_c = 1,
          reel_bonus = 1
        }
      }
    },
    rarity = 2,
    atlas = "OneArmedBandit",
    pos = { x = 0, y = 0 },
    flipbook_pos_extra = {
      arm = { x = 1, y = 0 },
      coin = { x = 1, y = 3 },
      reel_a = { x = 7, y = 3 },
      reel_b = { x = 7, y = 4 },
      reel_c = { x = 7, y = 5 },
      reel_bonus = { x = 6, y = 6 },
      --[[prize_base = { x = 1, y = 3 },
    prize_bonus = { x = 1, y = 3 }]] --
    },
    flipbook_anim_extra_states = {
      arm = {
        passive = {
          anim = { { x = 1, y = 0, t = 1 } },
          loop = false
        },
        pull = {
          anim = {
            { x = 1,                            y = 0, t = 0.5 },
            { xrange = { first = 2, last = 7 }, y = 0, t = 0.08 },
            { xrange = { first = 0, last = 7 }, y = 1, t = 0.08 },
            { xrange = { first = 0, last = 1 }, y = 2, t = 0.08 },
            { x = 1,                            y = 0, t = 1 }
          },
          loop = false,
          continuation = "passive"
        }
      },
      coin = {
        passive = {
          anim = { { x = 1, y = 3, t = 1 } },
          loop = false
        },
        insert = {
          anim = {
            { xrange = { first = 2, last = 7 }, y = 2, t = 0.03 },
            { x = 7,                            y = 2, t = 0.1 },
            { x = 0,                            y = 3, t = 0.03 },
            { x = 1,                            y = 3, t = 1 }
          },
          loop = false,
          continuation = "passive"
        }
      },
      --[[prize_base = {
      passive = {
        anim = { { x = 1, y = 3, t = 1 } },
        loop = false
      },
      flush = {
        anim = {
          { xrange = { first = 8, last = 11 }, y = 3, t = 0.1 }
        },
        loop = false,
        continuation = "passive"
      },
      line = {
        anim = {
          { xrange = { first = 8, last = 11 }, y = 4, t = 0.1 },
          { x = 8,                             y = 5, t = 0.1 }
        },
        loop = false,
        continuation = "passive"
      },
      jackpot = {
        anim = {
          { xrange = { first = 9, last = 11 }, y = 5, t = 0.1 },
          { xrange = { first = 7, last = 11 }, y = 6, t = 0.1 }
        },
        loop = false,
        continuation = "passive"
      }
    },
    prize_bonus = {
      passive = {
        anim = { { x = 1, y = 3, t = 1 } },
        loop = false
      },
      coin = {
        anim = {
          { xrange = { first = 8, last = 10 }, y = 7, t = 0.1 },
          { x = 1,                             y = 3, t = 1 }
        },
        loop = false,
        continuation = "passive"
      },
    },]] --
      -- Yipes! Lotsa stuff.
      reel_a = {
        heart = { anim = { { x = 2, y = 3, t = 1 } }, loop = false },
        diamond = { anim = { { x = 3, y = 3, t = 1 } }, loop = false },
        club = { anim = { { x = 4, y = 3, t = 1 } }, loop = false },
        spade = { anim = { { x = 5, y = 3, t = 1 } }, loop = false },
        wild = { anim = { { x = 6, y = 3, t = 1 } }, loop = false },
        seven = { anim = { { x = 7, y = 3, t = 1 } }, loop = false },
        spin_from_seven = {
          anim = {
            { x = 0, y = 4, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 6, t = 0.05 }, { x = 6, y = 3, t = 0.05 },
            { x = 1, y = 6, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = true
        },
        spin_from_heart_a = {
          anim = {
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 6, t = 0.05 }, { x = 6, y = 3, t = 0.05 },
            { x = 1, y = 6, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_diamond_a = {
          anim = {
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 6, t = 0.05 }, { x = 6, y = 3, t = 0.05 },
            { x = 1, y = 6, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_club_a = {
          anim = {
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 6, t = 0.05 }, { x = 6, y = 3, t = 0.05 },
            { x = 1, y = 6, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_spade_a = {
          anim = {
            { x = 0, y = 6, t = 0.05 }, { x = 6, y = 3, t = 0.05 },
            { x = 1, y = 6, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_wild = {
          anim = {
            { x = 1, y = 6, t = 0.05 }, { x = 2, y = 3, t = 0.05 },
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_heart_b = {
          anim = {
            { x = 1, y = 4, t = 0.05 }, { x = 3, y = 3, t = 0.05 },
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_diamond_b = {
          anim = {
            { x = 0, y = 5, t = 0.05 }, { x = 4, y = 3, t = 0.05 },
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_club_b = {
          anim = {
            { x = 1, y = 5, t = 0.05 }, { x = 5, y = 3, t = 0.05 },
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_spade_b = {
          anim = {
            { x = 0, y = 7, t = 0.05 }, { x = 7, y = 3, t = 0.05 },
          },
          loop = false,
          continuation = "spin_from_seven"
        }
      },
      reel_b = {
        heart = { anim = { { x = 2, y = 4, t = 1 } }, loop = false },
        diamond = { anim = { { x = 3, y = 4, t = 1 } }, loop = false },
        club = { anim = { { x = 4, y = 4, t = 1 } }, loop = false },
        spade = { anim = { { x = 5, y = 4, t = 1 } }, loop = false },
        wild = { anim = { { x = 6, y = 4, t = 1 } }, loop = false },
        seven = { anim = { { x = 7, y = 4, t = 1 } }, loop = false },
        spin_from_seven = {
          anim = {
            { x = 1, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 5, y = 7, t = 0.05 }, { x = 6, y = 4, t = 0.05 },
            { x = 6, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = true
        },
        spin_from_diamond_a = {
          anim = {
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 5, y = 7, t = 0.05 }, { x = 6, y = 4, t = 0.05 },
            { x = 6, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_club_a = {
          anim = {
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 5, y = 7, t = 0.05 }, { x = 6, y = 4, t = 0.05 },
            { x = 6, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_spade_a = {
          anim = {
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 5, y = 7, t = 0.05 }, { x = 6, y = 4, t = 0.05 },
            { x = 6, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_heart_a = {
          anim = {
            { x = 5, y = 7, t = 0.05 }, { x = 6, y = 4, t = 0.05 },
            { x = 6, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_wild = {
          anim = {
            { x = 6, y = 7, t = 0.05 }, { x = 3, y = 4, t = 0.05 },
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_diamond_b = {
          anim = {
            { x = 2, y = 7, t = 0.05 }, { x = 4, y = 4, t = 0.05 },
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_club_b = {
          anim = {
            { x = 3, y = 7, t = 0.05 }, { x = 5, y = 4, t = 0.05 },
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_spade_b = {
          anim = {
            { x = 4, y = 7, t = 0.05 }, { x = 2, y = 4, t = 0.05 },
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_heart_b = {
          anim = {
            { x = 7, y = 7, t = 0.05 }, { x = 7, y = 4, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        }
      },
      reel_c = {
        heart = { anim = { { x = 2, y = 5, t = 1 } }, loop = false },
        diamond = { anim = { { x = 3, y = 5, t = 1 } }, loop = false },
        club = { anim = { { x = 4, y = 5, t = 1 } }, loop = false },
        spade = { anim = { { x = 5, y = 5, t = 1 } }, loop = false },
        wild = { anim = { { x = 6, y = 5, t = 1 } }, loop = false },
        seven = { anim = { { x = 7, y = 5, t = 1 } }, loop = false },
        spin_from_seven = {
          anim = {
            { x = 8, y = 0, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9, y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 8, y = 1, t = 0.05 }, { x = 6, y = 5, t = 0.05 },
            { x = 9, y = 1, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9,  y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = true
        },
        spin_from_club_a = {
          anim = {
            { x = 9,  y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 8,  y = 1, t = 0.05 }, { x = 6, y = 5, t = 0.05 },
            { x = 9, y = 1, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9, y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_spade_a = {
          anim = {
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 8, y = 1, t = 0.05 }, { x = 6, y = 5, t = 0.05 },
            { x = 9, y = 1, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9,  y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_heart_a = {
          anim = {
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 8,  y = 1, t = 0.05 }, { x = 6, y = 5, t = 0.05 },
            { x = 9, y = 1, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9, y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_diamond_a = {
          anim = {
            { x = 8, y = 1, t = 0.05 }, { x = 6, y = 5, t = 0.05 },
            { x = 9, y = 1, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9,  y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_wild = {
          anim = {
            { x = 9, y = 1, t = 0.05 }, { x = 4, y = 5, t = 0.05 },
            { x = 9, y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_club_b = {
          anim = {
            { x = 9,  y = 0, t = 0.05 }, { x = 5, y = 5, t = 0.05 },
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_spade_b = {
          anim = {
            { x = 10, y = 0, t = 0.05 }, { x = 2, y = 5, t = 0.05 },
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_heart_b = {
          anim = {
            { x = 11, y = 0, t = 0.05 }, { x = 3, y = 5, t = 0.05 },
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_diamond_b = {
          anim = {
            { x = 10, y = 1, t = 0.05 }, { x = 7, y = 5, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        }
      },
      reel_bonus = {
        heart = { anim = { { x = 2, y = 6, t = 1 } }, loop = false },
        diamond = { anim = { { x = 3, y = 6, t = 1 } }, loop = false },
        club = { anim = { { x = 4, y = 6, t = 1 } }, loop = false },
        spade = { anim = { { x = 5, y = 6, t = 1 } }, loop = false },
        seven = { anim = { { x = 6, y = 6, t = 1 } }, loop = false },
        spin_from_seven = {
          anim = {
            { x = 11, y = 1, t = 0.05 }, { x = 5, y = 6, t = 0.05 },
            { x = 8,  y = 2, t = 0.05 }, { x = 2, y = 6, t = 0.05 },
            { x = 9,  y = 2, t = 0.05 }, { x = 3, y = 6, t = 0.05 },
            { x = 10, y = 2, t = 0.05 }, { x = 4, y = 6, t = 0.05 },
            { x = 11, y = 2, t = 0.05 }, { x = 6, y = 6, t = 0.05 }
          },
          loop = true
        },
        spin_from_spade = {
          anim = {
            { x = 8, y = 2, t = 0.05 }, { x = 2, y = 6, t = 0.05 },
            { x = 9, y = 2, t = 0.05 }, { x = 3, y = 6, t = 0.05 },
            { x = 10, y = 2, t = 0.05 }, { x = 4, y = 6, t = 0.05 },
            { x = 11, y = 2, t = 0.05 }, { x = 6, y = 6, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_heart = {
          anim = {
            { x = 9,  y = 2, t = 0.05 }, { x = 3, y = 6, t = 0.05 },
            { x = 10, y = 2, t = 0.05 }, { x = 4, y = 6, t = 0.05 },
            { x = 11, y = 2, t = 0.05 }, { x = 6, y = 6, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_diamond = {
          anim = {
            { x = 10, y = 2, t = 0.05 }, { x = 4, y = 6, t = 0.05 },
            { x = 11, y = 2, t = 0.05 }, { x = 6, y = 6, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
        spin_from_club = {
          anim = {
            { x = 11, y = 2, t = 0.05 }, { x = 6, y = 6, t = 0.05 }
          },
          loop = false,
          continuation = "spin_from_seven"
        },
      },
    },
    flipbook_anim_extra_initial_states = { arm = "passive", coin = "passive", --[[prize_base = "passive", prize_bonus = "passive",]] reel_a = "seven", reel_b = "seven", reel_c = "seven", reel_bonus = "seven" },
    cost = 4,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.spin_cost, card.ability.extra.flush_prize, card.ability.extra.line_prize, card.ability.extra.jackpot_prize, card.ability.extra.bonus_reel_prize } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    calculate = function(self, card, context)

    end,

    gstpst_bandit_spin = function(self)
      ease_dollars(-self.ability.extra.spin_cost)

      local reel_a_start = G.gstpst_onearmedbandit_reels.reel_a[self.ability.extra.reel_states.reel_a]
      if self.ability.extra.reel_states.reel_a > 6 then
        reel_a_start = reel_a_start .. "_b"
      elseif self.ability.extra.reel_states.reel_a > 1 and self.ability.extra.reel_states.reel_a < 6 then
        reel_a_start = reel_a_start .. "_a"
      end

      local reel_b_start = G.gstpst_onearmedbandit_reels.reel_b[self.ability.extra.reel_states.reel_b]
      if self.ability.extra.reel_states.reel_b > 6 then
        reel_b_start = reel_b_start .. "_b"
      elseif self.ability.extra.reel_states.reel_b > 1 and self.ability.extra.reel_states.reel_b < 6 then
        reel_b_start = reel_b_start .. "_a"
      end

      local reel_c_start = G.gstpst_onearmedbandit_reels.reel_c[self.ability.extra.reel_states.reel_c]
      if self.ability.extra.reel_states.reel_c > 6 then
        reel_c_start = reel_c_start .. "_b"
      elseif self.ability.extra.reel_states.reel_c > 1 and self.ability.extra.reel_states.reel_c < 6 then
        reel_c_start = reel_c_start .. "_a"
      end

      local reel_bonus_start = G.gstpst_onearmedbandit_reels.reel_bonus[self.ability.extra.reel_states.reel_bonus]

      self.ability.extra.reel_states.reel_a = G.reel_test and G.reel_test[1] or
          pseudorandom("gstpst_onearmedbandit_a", 1, #G.gstpst_onearmedbandit_reels.reel_a)
      self.ability.extra.reel_states.reel_b = G.reel_test and G.reel_test[2] or
          pseudorandom("gstpst_onearmedbandit_b", 1, #G.gstpst_onearmedbandit_reels.reel_b)
      self.ability.extra.reel_states.reel_c = G.reel_test and G.reel_test[3] or
          pseudorandom("gstpst_onearmedbandit_c", 1, #G.gstpst_onearmedbandit_reels.reel_c)
      self.ability.extra.reel_states.reel_bonus = G.reel_test and G.reel_test[4] or
          pseudorandom("gstpst_onearmedbandit_bonus", 1, #G.gstpst_onearmedbandit_reels.reel_bonus)

      local symbol_a, symbol_b, symbol_c, symbol_bonus =
          G.gstpst_onearmedbandit_reels.reel_a[self.ability.extra.reel_states.reel_a],
          G.gstpst_onearmedbandit_reels.reel_b[self.ability.extra.reel_states.reel_b],
          G.gstpst_onearmedbandit_reels.reel_c[self.ability.extra.reel_states.reel_c],
          G.gstpst_onearmedbandit_reels.reel_bonus[self.ability.extra.reel_states.reel_bonus]

      local scoring_type = "passive"
      local prize = 0
      if symbol_a == "seven" and symbol_b == "seven" and symbol_c == "seven" then
        scoring_type = "jackpot"
        prize = self.ability.extra.jackpot_prize
      elseif symbol_a == "seven" and symbol_b == "seven" and symbol_c ~= "seven" then
        scoring_type = "jackpot miss"
        prize = 0
      elseif (symbol_a == symbol_b or symbol_a == "wild" or symbol_b == "wild")
          and (symbol_b == symbol_c or symbol_b == "wild" or symbol_c == "wild")
          and (symbol_c == symbol_a or symbol_c == "wild" or symbol_a == "wild")
          and symbol_a ~= "seven" and symbol_b ~= "seven" and symbol_c ~= "seven" then
        scoring_type = "line"
        prize = self.ability.extra.line_prize
      elseif symbol_a ~= "seven" and symbol_b ~= "seven" and symbol_c ~= "seven" then
        local colour_focus = symbol_a == "wild" and (symbol_b == "wild" and symbol_c or symbol_b) or symbol_a
        local colour = gstpst_bandit_get_colour(colour_focus)

        if colour == "wild" or ((gstpst_bandit_get_colour(symbol_a) == colour or symbol_a == "wild")
              and (gstpst_bandit_get_colour(symbol_b) == colour or symbol_b == "wild")
              and (gstpst_bandit_get_colour(symbol_c) == colour or symbol_c == "wild")) then
          scoring_type = "flush"
          prize = self.ability.extra.flush_prize
        end
      end

      if scoring_type == "passive" and symbol_c ~= "seven" and pseudorandom("gstpst_onearmedbandit_fail_scare", 1, 40) == 1 then
        self.ability.extra.reel_states.reel_a = G.reel_test and G.reel_test[1] or 1
        self.ability.extra.reel_states.reel_b = G.reel_test and G.reel_test[2] or 1
        symbol_a = "seven"
        symbol_b = "seven"
        scoring_type = "jackpot miss"
        prize = 0
      end

      local bonus_prize = symbol_bonus == symbol_c and prize > 0 and self.ability.extra.bonus_reel_prize or 0

      self:flipbook_set_anim_extra_state("pull", "arm")
      self:flipbook_set_anim_extra_state("insert", "coin")
      --self:flipbook_set_anim_extra_state("passive", "prize_base")
      --self:flipbook_set_anim_extra_state("passive", "prize_bonus")
      if scoring_type == "jackpot" or scoring_type == "jackpot miss" then
        play_sound("gstpst_bandit_play_long", 1, 0.8)
      else
        play_sound("gstpst_bandit_play", 1, 0.8)
      end

      G.E_MANAGER:add_event(Event({ trigger = "before", timer = "REAL", delay = 0.9, func = function() return true end }))

      G.E_MANAGER:add_event(Event({
        func = function()
          self:flipbook_set_anim_extra_state("spin_from_" .. reel_a_start, "reel_a")
          self:flipbook_set_anim_extra_state("spin_from_" .. reel_b_start, "reel_b")
          self:flipbook_set_anim_extra_state("spin_from_" .. reel_c_start, "reel_c")
          self:flipbook_set_anim_extra_state("spin_from_" .. reel_bonus_start, "reel_bonus")
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({ trigger = "before", timer = "REAL", delay = 0.5, func = function() return true end }))

      G.E_MANAGER:add_event(Event({
        trigger = "before",
        timer = "REAL",
        delay = 0.5,
        func = function()
          self:flipbook_set_anim_extra_state(symbol_a, "reel_a")
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = "before",
        timer = "REAL",
        delay = 0.5,
        func = function()
          self:flipbook_set_anim_extra_state(symbol_b, "reel_b")
          return true
        end
      }))
      if scoring_type == "jackpot" or scoring_type == "jackpot miss" then
        G.E_MANAGER:add_event(Event({
          trigger = "before",
          timer = "REAL",
          delay = 1,
          func = function()
            if scoring_type == "jackpot" then
              play_sound("gstpst_bandit_jackpot", 1, 0.8)
            else
              play_sound("gstpst_bandit_jackpot_miss", 1, 0.8)
            end
            return true
          end
        }))
      end
      G.E_MANAGER:add_event(Event({
        func = function()
          self:flipbook_set_anim_extra_state(symbol_c, "reel_c")
          self:flipbook_set_anim_extra_state(symbol_bonus, "reel_bonus")

          --self:flipbook_set_anim_extra_state(scoring_type, "prize_base")
          --self:flipbook_set_anim_extra_state(bonus_prize > 0 and "coin" or "passive", "prize_bonus")

          if scoring_type == "line" then
            play_sound("gstpst_bandit_line", 1, 0.8)
          elseif scoring_type == "flush" then
            play_sound("gstpst_bandit_flush", 1, 0.8)
          end

          if bonus_prize > 0 then
            play_sound("gstpst_bandit_bonus", 1, 0.8)
          end

          if prize + bonus_prize > 0 then ease_dollars(prize + bonus_prize) end
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          G.GAME.STOP_USE = (G.GAME.STOP_USE or 0) - 1
          self.ability.extra.is_spinning = false
          return true
        end
      }))
    end
  })

  function gstpst_bandit_get_colour(symbol)
    return symbol == "wild" and "wild" or (symbol == "heart" or symbol == "diamond") and "light" or "dark"
  end

  G.FUNCS.gstpst_spin_bandit = function(e)
    G.GAME.STOP_USE = (G.GAME.STOP_USE or 0) + 1
    e.config.ref_table.ability.extra.is_spinning = true
    if e.config.ref_table.config.center.gstpst_bandit_spin then
      e.config.ref_table.config.center.gstpst_bandit_spin(e
        .config.ref_table)
    end
  end

  G.FUNCS.gstpst_can_spin_bandit = function(e)
    local card = e.config.ref_table

    if (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) or G.GAME.dollars - card.ability.extra.spin_cost < to_big(G.GAME.bankrupt_at) or card.ability.extra.is_spinning then
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    else
      e.config.colour = G.C.RED
      e.config.button = "gstpst_spin_bandit"
    end
  end
end

if not next(SMODS.find_mod("ColdBeans")) then --Wave Goodbye, Token of Appreciation
  SMODS.Sound({
    key = "bye",
    path = "gstpst_bye.ogg",
  })

  SMODS.Joker({
    key = "wavegoodbye",
    config = { extra = { money = 8 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 11, y = 6 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    calculate = function(self, card, context)
      if context.before and G.GAME.current_round.hands_left == 0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("gstpst_bye", 1, 1)
            return true
          end,
        }))
        return { dollars = card.ability.extra.money }
      end
    end,
  })

  SMODS.Joker({
    key = "tokenofappreciation",
    config = { extra = { money = 5 } },
    rarity = 1,
    atlas = "Jokers1",
    pos = { x = 2, y = 9 },
    pixel_size = { h = 67 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    calculate = function(self, card, context)
      if context.buying_card and context.card.config.center.set == "Joker" and context.card ~= card and not card.getting_sliced then
        return { dollars = card.ability.extra.money }
      end
    end,
  })
end










do --Buttons on Jokers
  local sell_use_ref = G.UIDEF.use_and_sell_buttons

  function G.UIDEF.use_and_sell_buttons(card)
    if not card or not card.config or not card.config.center or
        (card.config.center.key ~= "j_gstpst_onearmedbandit" and card.config.center.key ~= "j_gstpst_boris")
        or card.area ~= G.jokers then
      return sell_use_ref(card)
    end

    local sell = {
      n = G.UIT.C,
      config = { align = "cr" },
      nodes = {
        {
          n = G.UIT.C,
          config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = "sell_card", func = "can_sell_card" },
          nodes = {
            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
            {
              n = G.UIT.C,
              config = { align = "tm" },
              nodes = {
                {
                  n = G.UIT.R,
                  config = { align = "cm", maxw = 1.25 },
                  nodes = {
                    { n = G.UIT.T, config = { text = localize("b_sell"), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                  }
                },
                {
                  n = G.UIT.R,
                  config = { align = "cm" },
                  nodes = {
                    { n = G.UIT.T, config = { text = localize("$"), colour = G.C.WHITE, scale = 0.4, shadow = true } },
                    { n = G.UIT.T, config = { ref_table = card, ref_value = "sell_cost_label", colour = G.C.WHITE, scale = 0.55, shadow = true } }
                  }
                }
              }
            }
          }
        },
      }
    }

    if card.config and card.config.center and card.config.center.key == "j_gstpst_onearmedbandit" then
      local bandit_spin =
      {
        n = G.UIT.C,
        config = { align = "cr" },
        nodes = {
          {
            n = G.UIT.C,
            config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = (card.area and card.area.config.type == "joker") and 0 or 1, hover = true, shadow = true, colour = G.C.RED, button = "gstpst_spin_bandit", func = "gstpst_can_spin_bandit" },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = "cm", maxw = 1.25 },
                nodes = {
                  { n = G.UIT.T, config = { text = localize("b_gstpst_spin"), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                }
              },
              {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                  { n = G.UIT.T, config = { text = localize("$"), colour = G.C.WHITE, scale = 0.4, shadow = true } },
                  { n = G.UIT.T, config = { ref_table = card.ability.extra, ref_value = "spin_cost", colour = G.C.WHITE, scale = 0.55, shadow = true } }
                }
              }
            }
          }
        }
      }

      return {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
          {
            n = G.UIT.C,
            config = { padding = 0.15, align = "cl" },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = "cl" },
                nodes = { sell }
              },
              {
                n = G.UIT.R,
                config = { align = "cl" },
                nodes = { bandit_spin }
              }
            }
          }
        }
      }
    end



    if card.config and card.config.center and card.config.center.key == "j_gstpst_boris" then
      local boris_more =
      {
        n = G.UIT.C,
        config = { align = "cr" },
        nodes = {
          {
            n = G.UIT.C,
            config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = (card.area and card.area.config.type == "joker") and 0 or 1, hover = true, shadow = true, colour = G.C.RED, button = "gstpst_run_boris_menu", func = "gstpst_can_run_boris_menu" },
            nodes = {
              { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
              { n = G.UIT.T, config = { text = localize("b_gstpst_more"), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
            }
          }
        }
      }

      return {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
          {
            n = G.UIT.C,
            config = { padding = 0.15, align = "cl" },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = "cl" },
                nodes = { sell }
              },
              {
                n = G.UIT.R,
                config = { align = "cl" },
                nodes = { boris_more }
              }
            }
          }
        }
      }
    end

    return {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.15, align = "cl" },
          nodes = {
            {
              n = G.UIT.R,
              config = { align = "cl" },
              nodes = { sell }
            }
          }
        },
      }
    }
  end
end
