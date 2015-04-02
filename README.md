## Easy slugs (permalinks) for your rails models

`gem install superslug`

or add to your Gemfile:

`gem 'superslug'`

Add a slug column to your model:

```
class AddSlugToMyModel < ActiveRecord::Migration
  def change
    add_column :my_models, :slug, :string
  end
end
```

Include in your model

```
class MyModel < ActiveRecord::Base
  include SuperSlug
end
