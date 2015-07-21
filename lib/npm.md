# NPM and package.json utility for Ruby
--------------------------------------------------------------------------------

## Description
--------------------------------------------------------------------------------

A gem that simplifies working with package.json files.

- Adds `npm bin` to ENV['PATH']
- Loads package.json and make it available as properties

## Usage
--------------------------------------------------------------------------------

To use Npm
```ruby
require 'npm'
```

Simple usage
```ruby
npm = Npm.new

puts npm.name + '-' + npm.version

npm.install
npm.run 'browserify'

```

Custom locations
```ruby
npm = Npm.new( '/path/to/package.json' )
```
