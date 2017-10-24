### Ruby

In additional to the following guidelines, please also use the [.rubocop.yml](./.rubocop.yml) configuration file for new projects in conjunction with [HoundCI](https://houndci.com).

##### General
- Prefer `&&` and `||` over `and` and `or`.
- Prefer `map` over `collect`.

#### It's about time
Timezones are baffling in ruby. If you need context, [read this article by thoughtbot](https://robots.thoughtbot.com/its-about-time-zones). 
Rules of thumb:

- Times & Dates should always be stored as UTC in the database. We should _never_ store times with offsets.

** Don't use**
```ruby
Time.now
Date.today
Date.today.to_time
Time.parse("2015-07-04 17:05:37")
Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z")
```

** Do Use **

```ruby
Time.current
2.hours.ago
Time.zone.today
Date.current
1.day.from_now
Time.zone.parse("2015-07-04 17:05:37")
Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z").in_time_zone
```

##### Testing
- Prefer `assert_not` over `refute`.

##### Testing timezones

Never set `Time.zone = 'Something'` because it could persist through the entire test class and throw off other tests.
- Use timezone helpers to setup & teardown timezones `Time.use_zone(tz, &block)` or `set_timezone(tz)` with `reset_timezone()`
