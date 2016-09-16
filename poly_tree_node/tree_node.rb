class PolyTreeNode
  attr_accessor :children, :parent, :value
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(child)
    p child.value, self.value
    @children << child
    child.parent = self
  end

  def remove_child(child)
    unless @children.include?(child)
      raise "no kid here"
    end
    @children.delete(child)
    child.parent = nil
  end

  def parent=(parent)
    if @parent.nil?
      @parent = parent
    else
      @parent.children.delete(self)
      @parent = parent
    end

    if !parent.nil?
      parent.children << self unless parent.children.include?(self)
    end
  end

  def dfs(value)
    p self, value
    return self if self.value == value

    self.children.each do |child|
      child_value = child.dfs(value)
      return child_value if child_value
    end
    nil
  end

  def bfs(value)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == value
      queue += node.children
    end
    nil
  end

end
