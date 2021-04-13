class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :arr, :root

  def initiliaze(arr)
    @arr = arr
    @root = build_tree
  end
end