require 'squib'

deck = Squib.xlsx file: 'even-bigger.xlsx', strip: false, sheet: 0

Squib::Deck.new(cards: deck.nrows, layout: %w(dance-layout.yml even-bigger.yml)) do
  background color: '#ffffff'
  svg file: deck['Art'], layout: 'Art'

  %w(Title Description Snark).each do |key|
    text str: deck[key], layout: key
  end

  %w(Punch-Blast G-Clef).each do |key|
    svg file: "#{key.downcase}.svg", layout: "#{key}Icon"
    text str: deck[key], layout: key
  end
  rect layout: 'cut'
  rect layout: 'safe'
  save_pdf(trim: 0, margin: 0, gap: 0, columns: 3, rows: 3)
  save_sheet(trim: 0, margin: 0, gap: 0, columns: 3, rows: 3)
end
