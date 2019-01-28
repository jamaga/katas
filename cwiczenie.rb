# GETTER I SETTER
# class Car
#   # attr_writer :color
#   # attr_reader :color

#   attr_accessor :color

#   def initialize(color)
#     @color = color
#   end

#   # def color
#   #   @color
#   # end

#   # def color=(val)
#   #   @color = val
#   # end
# end

# c = Car.new('red')
# c.color = 'orange'

# puts c.color

# METODY KLASOWE I INSTANCYJNE
# MODULY EXTEND i INCLUDE
# module Audi
#   def brand
#     'audi'
#   end
# end

# module BlackColor
#   def color
#     'black'
#   end  
# end

# class Car
#   include BlackColor

#   def self.color
#     'not red'
#   end
# end

# class Bike
#   include BlackColor
# end



# puts Car.color
# puts Car.new.color

# # ob = Car.new
# # ob.x = 2

# # ob.add(3) => 2 + 3 

# # Car.x
# # Car.add


# a = Car.new
# a.extend(Audi)
# puts a.brand
# b = Car.new
# b.brand


# DZIEDZICZENIE

# class Car
#   def color
#     fail 'This is an abstract class'
#   end
# end

# class Audi < Car
#   def color
#     'black'
#   end
# end

# class Bmw < Car

# end


# audi = Audi.new
# puts audi.color
# puts Audi.ancestors
# puts Car.new.color

# Iteracje

# a = (1..10).each do |el|
#   el + 2
# end

# b = (1..10).map do |el|
#   el + 2
# end

# c = (1..10).each_with_object({a: 'a'}) do |el, ob|
#   ob[el] = el
# end

# puts a 
# puts b
# puts c


# Send

# class Audi
#   def get_color
#     color
#   end

#   private

#   def color
#     'black'
#   end
# end

# a = Audi.new
# puts a.get_color
# # puts a.send(:color)

# ['get_color'].each do |method_name|
#   Audi.new.send(method_name)
# end
# Audi.new.'get_color'

