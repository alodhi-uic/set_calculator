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
      when /^X (.*)$/
        values = $1.split(',').map(&:to_i)
        @x = BranchingSet.new
        values.each { |val| @x.add(val) }
      when /^Y (.*)$/
        values = $1.split(',').map(&:to_i)
        @y = ArrayedSet.new
        values.each { |val| @y.add(val) }

        # Display Both Sets
      when "l"
        @x.display
        @y.display
      when "lx"
        @x.display
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
      when 'c'
        # Call copy method from functions.rb
        @y = Marshal.load(Marshal.dump(@x))
        # @y = @x.class.new(@x.set)
      when "type"
        puts "Set X -> Type: #{@x.type}"
        puts "Set Y -> Type: #{@y.type}"
      when "q"
        @x.display
        @y.display
        break
      else
        puts "Invalid command"
      end
    end
  end

  private



  # This method evaluates the lambda expression and applies it to each element in Set X
end

calculator = SetCalculator.new
calculator.run




