require_relative 'branching_set'
require_relative 'arrayed_set'
require_relative 'functions'

class SetCalculator
  def initialize
    @x = BranchingSet.new
    @y = ArrayedSet.new
  end

  def run
    loop do
      print "> "
      command = gets.chomp
      case command

        # Initialize Set X : Branching
      when /^X (.*)$/
        values = $1.split(',').map(&:to_i)
        @x = BranchingSet.new
        values.each { |val| @x.add(val) }

        # Initialize Set Y : Arrayed
      when /^Y (.*)$/
        values = $1.split(',').map(&:to_i)
        @y = ArrayedSet.new
        values.each { |val| @y.add(val) }

        # Display Both Sets
      when "l"
        @x.display
        @y.display
        # Display Only X
      when "lx"
        @x.display
        # Display Only Y
      when "ly"
        @y.display

        # Add number to Branching Set X
      when /^a (.*)$/
        number = $1.to_i
        @x.add(number)

        # Swap both sets
      when "x"
        swap(@x, @y)

        # Union
      when "u"
        union(@x, @y)

        # Intersection
      when "i"
        intersection(@x, @y)

        # Copy Set X into Y, replacing content of Y
      when 'c'
        @y = Marshal.load(Marshal.dump(@x))

        # Find type of Set X,Y (Branching/Arrayed)
      when "type"
        puts "Set X -> Type: #{@x.type}"
        puts "Set Y -> Type: #{@y.type}"

        # Apply Lambda expression on Set Y. Command: m -> (y){y*3}
      when /^m (.+)$/
        lambda_str = $1
        begin
          lambda_expr = eval(lambda_str)
          if lambda_expr.is_a?(Proc)
            @y.apply_lambda(lambda_expr)
          else
            puts "Invalid lambda expression."
          end
        rescue => e
          puts "Error: #{e.message}"
        end

        # Quit
      when "q"
        @x.display
        @y.display
        break

      else
        puts "Invalid command"
      end
    end
  end
end

calculator = SetCalculator.new
calculator.run




