require 'squib'

deck = Squib.xlsx file: 'even-bigger.xlsx'
Squib::Deck.new(cards: deck.nrows, layout: %w(hand.yml even-bigger.yml)) do
  background color: '#230602'
  svg file: deck['Art'], layout: 'Art'

  %w(Title Description Snark).each do |key|
    text str: deck[key], layout: key
  end

  %w(Attack Defend Health).each do |key|
    svg file: "#{key.downcase}.svg", layout: "#{key}Icon"
    text str: deck[key], layout: key
  end
  save_pdf
  save_sheet
end
