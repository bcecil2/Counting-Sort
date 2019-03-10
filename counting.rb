def countingsort(list)
	max = list.max

	# build output array and initialize
	# radix array to the size of the greatest digit
	output = Array.new(list.length, 0)
	radix_array = Array.new(max, 0)

	# fill in the radix arrays indexes with the
	# amount of times the given number occurs
	list.each do |num|
		radix_array[num - 1] += 1
	end

	# creates a sum of the occurence of the
	# the given number and the occurence of numbers
	# less than it
	(0).upto(radix_array.length - 2) { |num| radix_array[num + 1] += radix_array[num]}

	#radix_array.each_index{ |num| puts "index: #{num}, count: #{radix_array[num]}"}

	# builds the output array by using the
	# radix array as a hash to the values
	# location in the sorted array
	list.each do |num|
		output[radix_array[num-1]-1] = num
		radix_array[num-1] -= 1
	end

	return output
end

x = [1,4,1,2,7,5,2]
randy = Random.new(1234)
#size = 2**24
#size.downto(0) { |n| x.push(randy.rand(10..100000)) }
begin_t = Time.now
countingsort(x)
end_t = Time.now
puts "Time to counting sort #{size} bois and grills: #{end_t - begin_t}"
begin_t = Time.now
x.sort
end_t = Time.now
puts "Time to ruby sort #{size} bois and grills: #{end_t - begin_t}"