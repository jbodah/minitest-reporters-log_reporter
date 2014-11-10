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
