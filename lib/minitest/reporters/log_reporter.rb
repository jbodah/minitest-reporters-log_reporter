module Minitest
  module Reporters
    class LogReporter < DefaultReporter
      # Force override the IO
      def add_defaults(options)
        super
        @log_file = options[:log_file] || 'log/minitest.log'
        @io = File.new(@log_file, 'w')
      end

      # task start
      def start
        super
        $stdout.puts "Logging results to #{@log_file}\n"
      end

      # task end
      def report
        super
        @io.close
      end

      private

      [:green, :red, :yellow].each do |sym|
        define_method(sym) {|str| str}
      end
    end
  end
end
