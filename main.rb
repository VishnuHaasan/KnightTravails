class Knight
  STEPS = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
  attr_accessor :steps, :position, :parent
  @@visited = []

  def initialize(position,parent)
    @position = position
    @steps = []
    @parent = parent
  end

  def check(element)
    return element[0]>7 || element[0]<0 || element[1]>7 || element[1]<0
  end

  def possible_paths
    return STEPS.map{|e| [e[0]+@position[0],e[1]+@position[1]]}.reject{|e| check(e)}.reject{|e| @@visited.include?(e)}
    .map{|e| Knight.new(e,self)}
  end
end

def print_path(n1,n2)
  puts "The path followed : "
  queue = []
  until n1.parent === nil do
    n1 = n1.parent
    queue.push(n1)
  end

  position = queue.map {|e| e.position}
  p position.reverse
end

def knight_travails
  puts "enter the x value of starting coordinate: "
  x_start = gets.chomp.to_i
  puts "enter the y value of starting coordinate: "
  y_start = gets.chomp.to_i
  puts "enter the x value of destination coordinate: "
  x_dest = gets.chomp.to_i
  puts "enter the y value of destination coordinate: "
  y_dest = gets.chomp.to_i
  n1 = [x_start,y_start]
  n2 = [x_dest,y_dest]
  q = []
  t = n2
  new_knight = Knight.new(n1,nil)
  while new_knight.position != t do
    new_knight.possible_paths.map{|e| q.push(e)}
    new_knight = q.shift
  end
  print_path(q[0],n2)
end

knight_travails