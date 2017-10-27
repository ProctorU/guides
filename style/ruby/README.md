### Ruby

In additional to the following guidelines, please also use the [.rubocop.yml](./.rubocop.yml) configuration file for new projects in conjunction with [HoundCI](https://houndci.com).

##### General
- Use single quotes over double quotes.
- Prefer `&&` and `||` over `and` and `or`.
- Prefer `map` over `collect`.
- Prefer `cookies.signed` over `cookies` to prevent [tampering](http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html).
- Add `touch: true` when declaring `belongs_to` associations.
- Add `dependent: :destroy` for has_many associations.
- Use only one instance variable in views.
- Use only local variables in partials.
- Times & Dates should always be stored as UTC in the database. We should _never_ store times with offsets. If you need context, [read this article by thoughtbot](https://robots.thoughtbot.com/its-about-time-zones). 

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
- Prefer `size` over `count` or `length`. [Reference](https://stackoverflow.com/a/6083229/2456549).

##### Testing
- Prefer `assert_not` over `refute`.
- Never set `Time.zone = 'Something'` because it could persist through the entire test class and throw off other tests.
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
