class Card < ApplicationRecord
  enum card_type: { pebble: 0, spike: 1, bug: 2, task: 3 }
end
