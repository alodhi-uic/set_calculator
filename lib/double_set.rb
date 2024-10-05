class DoubleSet

  def initialize
    @elements = []
    @root = nil
  end

  # Abstract method for adding an element
  def add(value)
    raise NotImplementedError, 'This method should be overridden in subclasses'
  end

  def apply_lambda(lambda_expr)
    # Apply the lambda to each element and replace the elements in the set
    @elements = @elements.map { |el| lambda_expr.call(el) }
  end

  def display
    puts "Set content: #{self.to_s}"
  end
end
