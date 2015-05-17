SuperSlug
==========

SuperSlug handles automatic generation of slugs (permalinks) for your rails
models

Installation
----------

This gem is meant to work with Ruby on Rails projects. I recommend you add it
to your project's Gemfile:

```ruby
gem 'superslug'
```

Then install your bundle:

```text
$ bundle
```

Usage
----------

All you need are two columns on an Active Record model. I use `title` and
`slug` by default, but you can use whatever you want.

> Note: It's always faster to use string columns unless you absolutely have to
> use text.

When you have your columns, just add the `has_superslug` method into your
model.

```ruby
has_superslug(source = :title, dest = :slug, options = {})
```

The `source` column is the column *from which you want to generate the slug*,
while the destination (dest) column is *where the sluggified string is stored*.

### Options

* **separator**: Defines the character with which to fill blank spaces in the
  string. For example, if it is a hyphen, then `Hello World` becomes `hello-
  world`. See below for an example.
* **force_update**: If `true`, the destination column (slug) will always be set
  when the record is saved. Otherwise, it doesn't change once it is first
  created, unless manually set.

### Example

If you have a `Page` model that has a `name` and a `permalink` column, and you
want to use underscore separators, then your model would look like this:

```ruby
class Page < ActiveRecord::Base
  has_superslug :name, :permalink, :separator => '_'
end
```

### Query Helpers

When you add the `has_superslug` method to your model, you also get a couple helpers.

First, SuperSlug assumes you are doing this to make friendly URLs, so it adds a
`to_param` method and uses your destination column for the parameter. Rails
uses the `id` attribute by default.

And second, the `find` method on an Active Record class using SuperSlug checks
for the slug first. Using the example above, if you ran `Page.find('hello-
world')`, it would check for pages with `permalink` matching `hello-world`, and
not the ID (which is the default).


Contributing
----------

1. Fork it ( https://github.com/[my-github-username]/cambium/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
