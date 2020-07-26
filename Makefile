build:
	gem build roman-numeral.gemspec

install: build
	gem install roman-numeral-0.1.0.gem

uninstall:
	gem uninstall roman-numeral

test:
	rspec

clean:
	rm -Rf Gemfile.lock roman-numeral-*.*.*.gem
