class Car
	@@total_car_count = 0
	@@cars_per_color = {}
	attr_accessor :color


	def self.total_car_count
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color)
		@fuel = 10
		@distance = 0
		@color = color
		@@total_car_count += 1
		if @@cars_per_color.include?(color)
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
	end


	def change_color(new_color)
		old_color = self.color
		@color = new_color
		@@cars_per_color[@color] += 1
		@@cars_per_color[old_color] -= 1
	end

	def self.most_popular_color
		hash_values = @@cars_per_color.values.sort.reverse
		most_popular = hash_values[0]
		puts most_popular
		@@cars_per_color.key(most_popular).to_s
	end


	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

car_a = Car.new('black')
car_b = Car.new('red')
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b

puts Car.total_car_count
c1 = Car.new('black')
puts Car.total_car_count
c2 = Car.new('black')
puts Car.total_car_count

# 1 - Class method on instance
# c = Car.new
# c.total_car_count 

# 2 - Class method on class
# Car.total_car_count

# # 3 - Instance method on class
# Car.drive(10)

# # 4 - Instance method on instance
c = Car.new ('red')
c.drive(10)
puts c

red_car = Car.new('red')
blue_car = Car.new('black')
red_car2 = Car.new('red')
black_car = Car.new('black')

red_car.color=('black') # change red_car color to black
puts red_car.color
puts Car.most_popular_color # black
