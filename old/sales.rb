file = "sales.txt"
count = File.foreach(file).inject(0) {|c, line| c+1}


doc = open(file, 'r')


def g(f,h,t)
	puts f
	puts "ha"
	puts t
	puts h
end

count.times do
	m = doc.readline.split
	g(m[0],m[1],m[2])
end


doc.close