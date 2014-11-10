minitest-reporters-log_reporter
====

An extension for minitest-reporters that adds a LogReporter which will write to log files.

minitest-reporters: https://github.com/kern/minitest-reporters

The motiviation for this library was for debugging our parallel test code which uses a separate process for each Minitest instance. In our implementation Minitest uses a different seed per process to randomize the tests which made it difficult to debug tests solely from $stdout

# Installation

```ruby
gem install minitest-reporters-log_reporter
```

# Usage

In your `test_helper.rb` file, add the LogReporter to your used reporters list

```ruby
require "minitest/reporters"
require "minitest/reporters/log_reporter"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new, Minitest::Reporters::LogReporter.new]
```

In the wild with parallel-test:

```ruby
require 'minitest/reporters'
use_color  = ENV['RUBBER_ENV'] != 'ci'
slow_count = ENV['SLOW_COUNT'] ? ENV['SLOW_COUNT'].to_i : 20
reporter = case ENV['REPORTER']
             when 'none' then nil
             when 'spec' then Minitest::Reporters::SpecReporter.new
             when 'progress' then Minitest::Reporters::ProgressReporter.new
             else Minitest::Reporters::DefaultReporter.new(:color => use_color,
                                                           :fast_fail => true,
                                                           :slow_count => slow_count)
           end

if ENV['TEST_ENV_NUMBER']
  log_file = ENV['TEST_ENV_NUMBER'].empty? ? 'log/minitest_1.log' : "log/minitest_#{ENV['TEST_ENV_NUMBER']}.log"
else
  log_file = 'log/minitest.log'
end

log_reporter = Minitest::Reporters::LogReporter.new(log_file: log_file)

Minitest::Reporters.use! [reporter, log_reporter]
```
