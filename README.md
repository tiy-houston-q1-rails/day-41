Day 41 - Shopping Cart
===============

No Challenge Today

Today:
-----

1. ShoppingCart
1. JSON REST API
2. StateMaching
3. `active_shipping`


Homework
-------

1. Create a Rails project that has no Views, only returns an API
2. I should be able to run the attached file `jsonit.rb` with no errors
3. It will create log entries, and search for them. So, you'll need an index and
   create action under `/api/logs`

Notes:

* Use `active_model_serializers`
* Your log.rb should look like

```ruby
require 'securerandom'
class Log < ActiveRecord::Base

  validates :contents, presence: true

  before_validation on: :create do
    self.token = SecureRandom.hex
  end
end
```
