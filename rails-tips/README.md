### Rails Tips

Rails tips are fun tid-bits of info that aren't best practices or opinionated.

##### Models
- Use [`with_options`](https://apidock.com/rails/Object/with_options) to group associations.

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
