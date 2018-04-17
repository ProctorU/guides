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

- On ActiveRecord relations, use
[`any?`](https://apidock.com/rails/ActiveRecord/Relation/any%3F) or [`exists?`](https://apidock.com/rails/ActiveRecord/FinderMethods/exists%3F)
instead of
[`present?`](https://apidock.com/rails/Object/present%3F).

  Each method determines if at least one record exists, but
  `present?` needs to load each record queried, while
  `any?` uses a SQL `count` statement and `exists?` only needs to load 1 record.
  Removing the unnecessary database hits brought by `present?` provides a significant
  improvement in speed when dealing with ActiveRecord relations.

  For example, where a Client `has_many` Projects:

    ```ruby
    # bad, loads all Project records (slow)
    Client.find(20).projects.where(status: 'finished').present?

    # better, uses a count statement on associated Projects (faster)
    Client.find(20).projects.where(status: 'finished').any?

    # best, only tries to load one Project and stops if it finds one (fastest)
    Client.find(20).projects.where(status: 'finished').exists?
  ```

  [Read more on this topic here.](https://www.ombulabs.com/blog/benchmark/performance/rails/present-vs-any-vs-exists.html)

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
