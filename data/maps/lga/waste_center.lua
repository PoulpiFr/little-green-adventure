-- Lua script of map lga/waste_center.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function quizz(goodAnswer)

    game:start_dialog("waste_center.which_item", function(answer)

    if answer == goodAnswer then
         game:start_dialog("waste_center.good_answer")
         value = game:get_value("waste_good_answers")
          if value == nil then
            value = 0                    
          end

          value = value + 1
          game:set_value("waste_good_answers", value)
    else
         game:start_dialog("waste_center.bad_answer")
    end

    end)

end

function white_trash:on_activated()
  if game:has_item("poulet") and game:has_item("coca") and game:has_item("empty_bottle") then
    quizz(4)
  else
    game:start_dialog("waste_center.not_enough_items")
  end
end

function green_trash:on_activated()
  if game:has_item("poulet") and game:has_item("coca") and game:has_item("empty_bottle") then
    quizz(3)
  else
    game:start_dialog("waste_center.not_enough_items")
  end
end

function yellow_trash:on_activated()
  if game:has_item("poulet") and game:has_item("coca") and game:has_item("empty_bottle") then
    quizz(2)
  else
    game:start_dialog("waste_center.not_enough_items")
  end
end

function waste_guy:on_interaction()
goodAnswersCount = game:get_value("waste_good_answers")
if  goodAnswersCount ~= nil and goodAnswersCount >= 3 then
  game:start_dialog("waste_center.happy_guy_at_the_waste_center.1", function()
          game:start_dialog("waste_center.happy_guy_at_the_waste_center.2", function()
          hero:start_treasure("usb_key")
        end)
    end)
else
   game:start_dialog("waste_center.sad_guy_at_the_waste_center")
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
