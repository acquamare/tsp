class Point
  attr_accessor :x, :y, :disto, :po

  def initialize(po,x,y)
    @po = po.to_s
    @x = x.to_i
    @y = y.to_i
    @disto = (@x**2 + @y**2)**0.5
  end

  def dist(n)
    return ((@x-n.x)**2+(@y-n.y)**2)**0.5
  end
end

a = Point.new('a',20,77)
b = Point.new('b',52,48)
c = Point.new('c',0,-90)

def tot(one,two,three)
  return one.disto + one.dist(two) +two.dist(three) + three.disto
end


array = [a,b,c].permutation.to_a
# The last half of the permutations are the same values..

array.each do |el|
  print el[0].po + el[1].po + el[2].po + ": "
  puts tot(el[0],el[1],el[2])
end