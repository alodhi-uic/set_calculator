class DoubleSet

  def initialize
    @elements = []
    @root = nil
  end


  # Abstract method for adding an element
  def add(value)
    raise NotImplementedError, 'This method should be overridden in subclasses'
  end

  def display
    puts "Set content: #{self.to_s}"
  end
end
