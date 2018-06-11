# ProctorU Guides

Guides is a foundation of best practices used by ProctorU's Engineering &
Design team. It includes best practices for Code Reviewing, Style Rules, and
much more.

---

## Ruby

In additional to the following guidelines, please also use the
[Rubocop](./.rubocop.yml) and [Reek](./config.reek) configuration files for new
projects.

### Local Configuration

It's always beneficial to have your favorite text editor linting your code
against the same configuration you use in your CI process. Here are some
text editor implementations for Rubocop and Reek.

**Atom**

1. Install `rubocop` and `reek` as gems.

    ```
    gem install rubocop reek
    ```

1. Install the [linter-rubocop](https://atom.io/packages/linter-rubocop) Atom
   package.

1. Install the [linter-reek](https://atom.io/packages/linter-reek) Atom
   package.

1. Copy the [rubocop](./.rubocop.yml) configuration file to your local
   directory. We check ours into `.gitignore` since we use the one here via
   [Code Climate](https://codeclimate.com).

1. Copy the [reek](./config.reek) configuration file to your local
   directory. We check ours into `.gitignore` since we use the one here via
   [Code Climate](https://codeclimate.com).

**Command Line with Pronto**

With Pronto, you can locally run the same suite as CodeClimate from the comfort of your terminal.

1. Install `pronto`.

    ```bash
    gem install pronto
    ```

1. Take care of any dependencies it might say you lack.

1. Install the following gems.

    ```bash
    gem install pronto-rubocop pronto-reek
    ```

1. Create a config file in your local directory so you can tell Pronto what to ignore.

    ```bash
    touch .pronto.yml
    ```

    ```
    all:
      exclude:
        - 'config/**/*'
        - 'db/**/*'
        - 'docs/**/*'
        - 'fixtures/**/*'
        - 'node_modules/**/*'
        - 'public/**/*'
        - 'test/**/*'
        - 'tmp/**/*'
        - 'vendor/**/*'
    ```

1. Tell your global-level `.gitignore` file not to track `.pronto.yml`.

    ```
    # Pronto yml
    .pronto.yml
    ```

1. Write some code and try it out!

    - `pronto run --commit` (will compare with local master by default)

    - `pronto run --commit origin/master` (to specify where to compare)

1. Finally, make an alias.

    ```bash
    alias prc='pronto run --commit'
    ```

**Vim**

TODO: add specific installation steps.
- https://github.com/ngmy/vim-rubocop
- https://github.com/rainerborene/vim-reek

**Emacs**

TODO: add specific installation steps.
- https://github.com/bbatsov/rubocop-emacs
https://github.com/hanmoi-choi/reek-emacs

### General

- Use single quotes over double quotes unless string interpolation is needed.

- Prefer `&&` and `||` over `and` and `or`.

- Prefer `map` over `collect`.

- Prefer `cookies.signed` over `cookies` to prevent [tampering](http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html).
- Add `touch: true` when declaring `belongs_to` associations.

- Add `dependent: :destroy` for has_many associations.

- Use only one instance variable in views.

- Use only local variables in partials.

- Times & Dates should always be stored as UTC in the database. We should
  _never_ store times with offsets. If you need context, [read this article by thoughtbot](https://robots.thoughtbot.com/its-about-time-zones).

    ```ruby
    # Do Not Use
    Time.now
    Date.today
    Date.today.to_time
    Time.parse("2015-07-04 17:05:37")
    Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z")

    # Do Use
    Time.current
    2.hours.ago
    Time.zone.today
    Date.current
    1.day.from_now
    Time.zone.parse("2015-07-04 17:05:37")
    Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z").in_time_zone
    ```
- Prefer `size` over `count` or `length`.
  [Reference](https://stackoverflow.com/a/6083229/2456549).

- Use `ENV.fetch('VARNAME')` instead of ENV. This will raise an error on
  deployment so developers can easily tell when they are missing ENVs.

    ```ruby
    # bad
    ENV['STRIPE_API_KEY']

    # good
    ENV.fetch('STRIPE_API_KEY')
    ```

- Prefer standard notation over shorthand notation for namespaced classes.

    ```ruby
    # bad
    class Students::ReservationsController < Students::BaseController
    end

    # good
    module Students
      class ReservationsController < Students::BaseController
      end
    end
    ```

### Testing

- Prefer `assert_not` over `refute`.

- Never set `Time.zone = 'Something'` because it could persist through the
  entire test class and throw off other tests.

- Use timezone helpers to setup & teardown timezones.

    ```ruby
    Time.use_zone(tz, &block)

    # or

    def setup
      set_timezone(tz)
    end

    def teardown
      reset_timezone()
    end
    ```

- Use MiniTest::Spec over Test::Unit.

    ```ruby

    # good

    setup do
      @user = users(:default)
    end

    test 'user should do something fancy' do
      assert @user.dances
    end

    # bad

    def setup
      @user = users(:default)
    end

    def user_should_do_something_fancy
      assert @user.dances
    end
    ```

- Use [specific assertion functions](http://guides.rubyonrails.org/testing.html#available-assertions)
  over `assert`. Using these functions gives much more meaningful results when tests fail.

    ```ruby

    # good

    assert_predicate @user, :valid? # on error: expected @user to be valid?

    assert_includes response['message'], 'must be a valid email' # on error: expected response['message'] to include 'must be a valid email`

    # bad

    assert @user.valid? # on error: expected false to be truthy

    assert response['message'].include?('must be a valid email') # on error: expect false to be truthy
    ```

### System Tests

##### Organization

System tests should be structured similar to controller namespaces. Each action should be broken into a corresponding test file. The index action should use the plural namespace or module name.

```
app
└─── controllers
|    └─── users
|    |   └─── registrations_controller.rb
system
└─── users
|    └─── registrations
│   │     |   show_registrations_test.rb
│   │     |   show_registration_test.rb
│   │     |   create_registration_test.rb
│   │     |   update_registration_test.rb
│   │     |   destroy_registration_test.rb
```
