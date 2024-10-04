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

        # Display Both Sets - working
      when "lx"
        @x.display
      when "ly"
        @y.display

        # Add number to Branching Set X - working
      when /^a (.*)$/
        number = $1.to_i
        @x.add(number)

        # Swap both sets - working
      when "x"
        swap(@x, @y)

        # -------------------------------------------------------------------------------------#
        # Union both sets - working
      when "u"
        union(@x, @y)
        # Intersection both sets - working
      when "i"
        intersection(@x, @y)
      when 'c'
        # Call copy method from functions.rb
        copy(@x, @y)
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


