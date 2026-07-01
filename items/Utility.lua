gstpst_flip_card_and_do = function(card, func, params)
  G.E_MANAGER:add_event(Event({
    trigger = "before",
    delay = 0.4,
    func = function()
      card:flip()
      play_sound("card1")
      card:juice_up(0.3, 0.3)
      return true
    end
  }))
  delay(0.2)
  G.E_MANAGER:add_event(Event({
    trigger = "before",
    delay = 0.2,
    func = function()
      func(params)
      return true
    end
  }))
  G.E_MANAGER:add_event(Event({
    trigger = "before",
    delay = 0.1,
    func = function()
      card:flip()
      play_sound("tarot2", 1, 0.6)
      return true
    end
  }))
end
