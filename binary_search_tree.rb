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

  def initialize(arr)
    @arr = arr
    @root = build_tree(@arr)
  end

  def build_tree(array)
    return nil if array.empty?

    sorted = array.uniq.sort
    mid = sorted.length / 2
    root = Node.new(sorted[mid])
    root.left = build_tree(sorted[0...mid])
    root.right = build_tree(sorted[mid + 1..sorted.length])
    root
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?
    return root if root.data == value

    if value < root.data
      root.left = insert(value, root.left)
    else
      root.right = insert(value, root.right)
    end

    root
  end

  def find(value, root = @root)
    return puts 'Value not found' if root.nil?

    if value == root.data
      puts "#{root}, Value: #{root.data}"
    elsif value < root.data
      find(value, root.left)
    else
      find(value, root.right)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
