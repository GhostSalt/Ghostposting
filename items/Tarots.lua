SMODS.Atlas {
  key = "JokerKitchenTarots",
  path = "GhostpostingJokerKitchenTarots.png",
  px = 71,
  py = 95
}

SMODS.Tarot {
  key = "horsemeat",
  pos = { x = 0, y = 0 },
  config = { },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = {  } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    
  end,
  in_pool = function()
    return next(SMODS.find_card("j_gstpst_jokerkitchen"))
  end
}

SMODS.Tarot {
  key = "redhotchilipeppers",
  pos = { x = 1, y = 0 },
  config = { },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = {  } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    
  end,
  in_pool = function()
    return next(SMODS.find_card("j_gstpst_jokerkitchen"))
  end
}

SMODS.Tarot {
  key = "grassofdeath",
  pos = { x = 2, y = 0 },
  config = { },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = {  } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    
  end,
  in_pool = function()
    return next(SMODS.find_card("j_gstpst_jokerkitchen"))
  end
}

SMODS.Tarot {
  key = "oilfromiraq",
  pos = { x = 0, y = 1 },
  config = { },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = {  } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    
  end,
  in_pool = function()
    return next(SMODS.find_card("j_gstpst_jokerkitchen"))
  end
}

SMODS.Tarot {
  key = "cheesefromsaopaolofrombrazil",
  pos = { x = 1, y = 1 },
  config = { },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = {  } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    
  end,
  in_pool = function()
    return next(SMODS.find_card("j_gstpst_jokerkitchen"))
  end
}

SMODS.Tarot {
  key = "breadmadeinturkey",
  pos = { x = 2, y = 1 },
  config = { },
  atlas = "JokerKitchenTarots",
  loc_vars = function(self, info_queue, card)
    return { vars = {  } }
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    
  end,
  in_pool = function()
    return next(SMODS.find_card("j_gstpst_jokerkitchen"))
  end
}