require 'json'

require_relative '../lib/roman-numeral'

# Loads Roman numerals data from JSON.
DATA_PATH = File.join(__dir__, 'data/roman-numerals.json')
DATA = JSON.parse(File.read(DATA_PATH)).transform_keys(&:to_i)

DATA.each do |arabic, roman|
  describe RomanNumeral, '#roman' do
    it "converts #{arabic} to #{roman}" do
      expect(RomanNumeral.new(arabic).roman).to eq roman
    end
  end
  describe RomanNumeral, '#arabic' do
    it "converts #{roman} to #{arabic}" do
      expect(RomanNumeral.new(roman).arabic).to eq arabic
    end
  end
end
