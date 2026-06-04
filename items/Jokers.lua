SMODS.Atlas {
  key = "Jokers1",
  path = "GhostpostingJokers1.png",
  px = 71,
  py = 95
}

do --Markiplier
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
      if context.joker_main and card.ability.extra.current_xmult > 1 then return { xmult = card.ability.extra.current_xmult } end

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

do --Tom Scott
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
      if context.joker_main and card.ability.extra.current_xmult > 1 then return { xmult = card.ability.extra.current_xmult } end

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
      G.GAME.gstpst_current_boris_card.ability.extra.ranks[i] = G.GAME.gstpst_current_boris_card.ability.extra.ranks[i] or 1

      cycles[#cycles + 1] =
      {
        n = G.UIT.R,
        config = { align = "cm", padding = 0 },
        nodes = {
          create_option_cycle({
            id = "gstpst_boris_cycle_" .. i,
            label = localize("b_boris_rank") .. " " .. i,
            scale = 0.8,
            options = all_ranks_localised,
            opt_callback = "gstpst_boris_change_rank",
            current_option = G.GAME.gstpst_current_boris_card.ability.extra.ranks[i]
          })
        }
      }
    end

    local boris_sprite = SMODS.create_sprite(0, 0, G.gstpst_borisUIX / 100, G.gstpst_borisUIY / 100, "gstpst_BorisUI", { x = 0, y = 0 })

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
      if args.cycle_config.id == "gstpst_boris_cycle_" .. i then
        G.GAME.gstpst_current_boris_card.ability.extra.ranks[i] = args.to_key
        return
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
    if type(G.GAME.blind.chips) ~= 'table' then
      chip_mod = math.ceil(math.abs(final_chips - G.GAME.blind.chips) / 120)
    else
      chip_mod = ((final_chips - G.GAME.blind.chips):abs() / 120):ceil()
    end
    local step = 0
    if G.GAME.blind.chips < final_chips then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blocking = true,
        func = function()
          G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
          if G.GAME.blind.chips < final_chips then
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            if step % 5 == 0 then
              play_sound('chips1', 0.8 + (step * 0.005))
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
        trigger = 'after',
        blocking = true,
        func = function()
          G.GAME.blind.chips = G.GAME.blind.chips - G.SETTINGS.GAMESPEED * chip_mod
          if G.GAME.blind.chips > final_chips then
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            if step % 5 == 0 then
              play_sound('chips1', 0.8 + (step * 0.005))
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
      self.children.center.role.r_bond = 'Weak'
      self.children.center.role.role_type = 'Major'
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

      self.ability.extra.reel_states.reel_a = G.reel_test and G.reel_test[1] or pseudorandom("gstpst_onearmedbandit_a", 1, #G.gstpst_onearmedbandit_reels.reel_a)
      self.ability.extra.reel_states.reel_b = G.reel_test and G.reel_test[2] or pseudorandom("gstpst_onearmedbandit_b", 1, #G.gstpst_onearmedbandit_reels.reel_b)
      self.ability.extra.reel_states.reel_c = G.reel_test and G.reel_test[3] or pseudorandom("gstpst_onearmedbandit_c", 1, #G.gstpst_onearmedbandit_reels.reel_c)
      self.ability.extra.reel_states.reel_bonus = G.reel_test and G.reel_test[4] or pseudorandom("gstpst_onearmedbandit_bonus", 1, #G.gstpst_onearmedbandit_reels.reel_bonus)

      local symbol_a, symbol_b, symbol_c, symbol_bonus = G.gstpst_onearmedbandit_reels.reel_a[self.ability.extra.reel_states.reel_a],
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

      local bonus_prize = symbol_bonus == symbol_c and self.ability.extra.bonus_reel_prize or 0

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
    if e.config.ref_table.config.center.gstpst_bandit_spin then e.config.ref_table.config.center.gstpst_bandit_spin(e.config.ref_table) end
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










do --Buttons on Jokers
  local sell_use_ref = G.UIDEF.use_and_sell_buttons

  function G.UIDEF.use_and_sell_buttons(card)
    if not card or not card.config or not card.config.center or
        (card.config.center.key ~= "j_gstpst_onearmedbandit" and card.config.center.key ~= "j_gstpst_boris") then
      return sell_use_ref(card)
    end

    local sell = {
      n = G.UIT.C,
      config = { align = "cr" },
      nodes = {
        {
          n = G.UIT.C,
          config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card' },
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
                    { n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                  }
                },
                {
                  n = G.UIT.R,
                  config = { align = "cm" },
                  nodes = {
                    { n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4, shadow = true } },
                    { n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55, shadow = true } }
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
            config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = G.C.RED, button = "gstpst_spin_bandit", func = "gstpst_can_spin_bandit" },
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
            config = { padding = 0.15, align = 'cl' },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = 'cl' },
                nodes = { sell }
              },
              {
                n = G.UIT.R,
                config = { align = 'cl' },
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
            config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = G.C.RED, button = "gstpst_run_boris_menu", func = "gstpst_can_run_boris_menu" },
            nodes = {
              { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
              { n = G.UIT.T, config = { text = localize('b_gstpst_more'), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
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
            config = { padding = 0.15, align = 'cl' },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = 'cl' },
                nodes = { sell }
              },
              {
                n = G.UIT.R,
                config = { align = 'cl' },
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
          config = { padding = 0.15, align = 'cl' },
          nodes = {
            {
              n = G.UIT.R,
              config = { align = 'cl' },
              nodes = { sell }
            }
          }
        },
      }
    }
  end
end
