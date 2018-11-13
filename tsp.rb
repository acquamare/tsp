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

def tot(perm)
	total = perm[0].disto + perm[-1].disto
	(0..perm.size-2).each do |i|
		total += perm[i].dist(perm[i+1])
	end
	return total
end


arr = Array.new


file = "tsp.txt"
count = File.foreach(file).inject(0) {|c, line| c+1}
doc = open(file, 'r')

count.times do
	point = doc.readline.split(",")
	arr << Point.new(point[0],point[1],point[2])
end

doc.close


array = arr.permutation.to_a

file = "tsp.csv"
doc = open(file, 'w')

n = 1
array.each do |el|
	el.each do |i|
		doc.write(i.po)
	end
	doc.write(', ')
	doc.write(tot(el))
	doc.write("\n")
	n += 1
end
doc.close