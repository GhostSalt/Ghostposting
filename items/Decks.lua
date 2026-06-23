SMODS.Atlas {
  key = "Decks",
  path = "GhostpostingDecks.png",
  px = 71,
  py = 95
}

SMODS.Back {
  key = "distracted",
  atlas = "Decks",
  pos = { x = 0, y = 0 },
  calculate = function(self, back, context)
    if context.after and context.scoring_name == "Straight Flush" then
      G.GAME.won = true
      check_for_unlock({ type = "round_win" })
      set_joker_usage()
      if not G.GAME.win_notified then
        G.GAME.win_notified = true
        G.E_MANAGER:add_event(Event({
          trigger = "immediate",
          blocking = false,
          blockable = false,
          func = (function()
            win_game()
            return true
          end)
        }))
      end
    end
  end
}
