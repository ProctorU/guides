# ProctorU Guides

Guides is a foundation of best practices used by ProctorU's Engineering &
Design team. It includes best practices for Code Reviewing, Style Rules, and
much more.

---

## Ruby

In additional to the following guidelines, please also use the
[Rubocop](./.rubocop.yml) and [Reek](./config.reek) configuration files for new
projects.

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
