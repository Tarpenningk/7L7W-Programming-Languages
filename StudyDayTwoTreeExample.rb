class Tree
attr_accessor :children, :node_name

def initialize(hash)
	hash.each do |name, children| 
	@node_name = name
	@children = children
	end
end

def visit_all(&block)
	visit &block
	children.each do |key, c|
	Tree.new({key => c}).visit_all &block
	end
end

def visit(&block)
	block.call self
	end
end

tree_example = Tree.new({ 'grandpa' => { 'dad' => {'child 1' => {'grandchild' => {}}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}, 'other_uncle' => {}}})

tree_example.visit_all {|node| puts node.node_name}
