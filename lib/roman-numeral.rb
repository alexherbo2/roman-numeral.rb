require 'strscan'

class RomanNumeral
  include Comparable

  attr_reader :arabic
  attr_reader :roman

  @@DEFINITION = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  # Overloading-like method
  def initialize(value)
    case value
    when Integer
      @arabic = value
      @roman = RomanNumeral.arabic_to_roman(value)
    when String
      @roman = value
      @arabic = RomanNumeral.roman_to_arabic(value)
    end
  end

  def to_i
    @arabic
  end

  def to_s
    @roman
  end

  # Converts numerals from Arabic (Integer) to Roman (String).
  def self.arabic_to_roman(arabic)
    roman = ''
    @@DEFINITION.each do |arabic_value, roman_value|
      count = arabic / arabic_value
      arabic = arabic % arabic_value

      chunk = roman_value * count
      roman << chunk
    end
    roman
  end

  # Converts numerals from Roman (String) to Arabic (Integer).
  def self.roman_to_arabic(roman)
    total = 0
    string_scanner = StringScanner.new(roman)
    until string_scanner.eos?
      arabic, roman = @@DEFINITION.find do |_arabic, roman|
        string_scanner.scan(Regexp.new(roman))
      end
      total += arabic
    end
    total
  end

  # Range ──────────────────────────────────────────────────────────────────────

  # Returns the next object in sequence.
  def succ
    RomanNumeral.new(@arabic + 1)
  end

  def <=>(other)
    @arabic <=> other.arabic
  end
end
