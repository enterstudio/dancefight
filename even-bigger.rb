require 'squib'
require 'game_icons'

deck = Squib.xlsx file: 'even-bigger.xlsx', strip: false, sheet: 0

Squib::Deck.new(cards: deck.nrows, layout: %w(hand.yml even-bigger.yml)) do
  #background color: '#230602'
  background color: '#ffffff'
  svg file: deck['Art'], layout: 'Art'

  %w(Title Description Snark).each do |key|
    text str: deck[key], layout: key
  end

  %w(Punch-Blast G-Clef Glass-Heart).each do |key|
    svg data: GameIcons::Icon.new("#{key.downcase}.svg").string.gsub(':#ffffff', 'colorswap').gsub(':#230602', ':#ffffff').gsub('colorswap', ':#230602'), layout: "#{key}Icon"
    text str: deck[key], layout: key
  end
  save_pdf(
	  trim: 0,
	  margin: 0,
	  gap: 0,
	  columns: 3,
	  rows: 3
  )
  save_sheet(
	  trim: 0,
	  margin: 0,
	  gap: 0,
	  columns: 3,
	  rows: 3
  )
end
