-- Lua script of map lga/unicorn_field.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function unicorn:on_interaction()
  if game:get_value("usb_key_traded") == nil then
    game:start_dialog("unicorn.trade_usb_key_proposition", function()
          if game:has_item("usb_key") then
         game:start_dialog("unicorn.give_300_coins", function()
          game:get_item("usb_key"):set_variant(0)
         hero:start_treasure("300_coins")
       end)
      end
    end)

  else
    game:start_dialog("unicorn.next_iphone")
  end
end

-- Event called at initialization time, as soon as this map becomes is loaded.
function map:on_started()

  -- You can initialize the movement and sprites of various
  -- map entities here.
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
