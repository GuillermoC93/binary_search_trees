# frozen_string_literal: true

# Node class for each node
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

# Binary Search Tree class
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

  def delete(value, root = @root)
    return root if root.nil?

    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      child = findmin(root.right)
      root.data = child.data
      root.right = delete(child.data, root.right)
    end
    root
  end

  def findmin(root = @root)
    current = root
    current = current.left while current.left

    current
  end

  def left_most(node)
    node = node.left until node.left.nil?

    node
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

  def level_order
    discovered = [root]
    results = []
    while discovered.empty? == false
      current = discovered[0]
      results << current.data
      discovered.push(current.left) unless current.left.nil?
      discovered.push(current.right) unless current.right.nil?
      discovered.shift
    end
    results
  end

  def preorder(root = @root, results = [])
    return results if root.nil?

    results.push(root.data)
    preorder(root.left, results)
    preorder(root.right, results)
  end

  def inorder(root = @root, results = [])
    return results if root.nil?

    inorder(root.left, results)
    results.push(root.data)
    inorder(root.right, results)
  end

  def postorder(root = @root, results = [])
    return results if root.nil?

    postorder(root.left, results)
    postorder(root.right, results)
    results.push(root.data)
  end

  def search(value, root = @root)
    if root.data == value
      root
    elsif value < root.data
      search(value, root.left)
    else
      search(value, root.right)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
