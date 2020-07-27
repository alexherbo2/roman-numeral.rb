# roman-numeral.rb

A command-line program and library for parsing and generating [Roman numerals].

[Roman numerals]: https://en.wikipedia.org/wiki/Roman_numerals

## Dependencies

- [Ruby]

[Ruby]: https://ruby-lang.org

## Installation

Run the following in your terminal:

``` sh
make install
```

## Usage

```
roman-numeral [arguments]
```

### Examples

``` sh
roman-numeral 42
# XLII
```

``` sh
roman-numeral XLII
# 42
```

``` sh
roman-numeral 1 3
# I
# II
# III
```

``` sh
roman-numeral 1 3 9
# I
# II
# III
# IX
```

``` sh
roman-numeral --format '[%s]' --separator '-' 1 2 3
# [I]-[II]-[III]
```

``` sh
echo I II III | roman-numeral --separator '+' | bc
# 6
```

## Options

```
--arabic / -i
  Convert to Arabic (Integer) numeral.

--roman / -s
  Convert to Roman (String) numeral.

--exclusive / -x
  Make the range exclusive.

--format / -f FORMAT
  Set text format (Default: %s).

--separator / -j SEPARATOR
  Configure separator (Default: ␤).

--help / -h
  Display a help message and quit.
```
