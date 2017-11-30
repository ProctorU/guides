# ProctorU Guides

Guides is a foundation of best practices used by ProctorU's Engineering &
Design team. It includes best practices for Code Reviewing, Style Rules, and
much more.

---

## Rails Tips

Rails tips are fun tid-bits of info that aren't best practices or opinionated.

### Models

- Use [`with_options`](https://apidock.com/rails/Object/with_options) to
  group associations.

  ```ruby
  class Account < ApplicationRecord
    # ok
    has_many :customers, dependent: :destroy
    has_many :products, dependent: :destroy
    has_many :invoices, dependent: :destroy
    has_many :expenses, dependent: :destroy

    # preferred
    with_options dependent: :destroy do
      has_many :customers
      has_many :products
      has_many :invoices
      has_many :expenses
    end
  end
  ```

### Benchmarking

- Benchmarking is the best way to determine performance differences between
  different methods in ruby.

    ```ruby
    require 'benchmark'

    Benchmark.bmbm do |x|
      x.report('Thing 1') do
        # Do some ruby...
      end

      x.report('Thing 2') do
        # Do some other ruby...
      end
    end
    ```

### Decorators

Decorators should be used to abstract object presentation away from models,
controllers, or views (or any other intermediary layer). Objects can be
"decorated", which adds behavior to the instance.

*Do use decorators for*
- Things like `@user.first_name` (object presentation)
- Things where object manipulation is repeated like `name.gsub("-", " ").titleize` in views or date formatting.

*Don't use decorators for*
- Model logic
- Complex view logic (Facades are better patterns for that)
- *Anything* that tries to modify the actual object (ie. saving/updating)
