# frozen_string_literal: true

require_relative 'binary_search_tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
p tree.balanced?
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
tree.insert(150)
tree.insert(250)
tree.insert(300)
p tree.balanced?
tree.rebalance
p tree.balanced?
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
