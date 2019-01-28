# Napisz klase która na podstawie podanej wartosci bedzie rysowac drzewko
# przykład:
# wartosc == 3
#   *
#  **
# ***
# Rysujemy drzewko pełne
# wartosc == 3
#   **
#  ****
# ******


# class Tree
#
#   def initialize(number)
#     @number = number
#   end
#
#   def self.half_draw(number)
#     new(number).half_draw
#   end
#
#   def self.full_draw(number)
#     new(number).full_draw
#   end
#
#   def half_draw
#     (0..@number).each do |num|
#       puts [' ' * (@number - num), '*' * num].join
#     end
#   end
#
#   def full_draw
#     (0..@number).each do |num|
#       puts [' ' * (@number - num), '*' * num * 2].join
#     end
#   end
# end

# Tree.half_draw(5)
# Tree.full_draw(5)

# Dziedziczenie

# class Tree
#
#   def initialize(number)
#     @number = number
#   end
#
#   def self.draw(number)
#     new(number).send(:iterate)
#     #send mi wywola nawet metode prywatna!!
#   end
#
#   private
#
#   def draw_spaces(count)
#     ' ' * count
#   end
#
#   def draw_stars(count)
#     '*' * count
#   end
#
#   def iterate
#     # (0..@number).each { |num| draw_line(num) }
#     (0..@number).each(&method(:draw_line))   # & - oznacza Blok
#   end
# end
#
# class HalfTree < Tree
#   def draw_line(num)
#     puts [draw_spaces(@number - num), draw_stars(num)].join
#   end
# end
#
# class FullTree < Tree
#   def draw_line(num)
#     puts [draw_spaces(@number - num), draw_stars(num * 2)].join
#   end
# end

# FullTree.draw(3)
# HalfTree.draw(4)

# Wzorca Adapter
#
# class Tree
#   def initialize(branches, type)
#     @branches = branches
#     @type = type
#   end
#
#   def self.draw(branches, type)
#     new(branches, type).iterate
#   end
#
#   def iterate
#     (1..@branches).map { |number| send(@type, number) }
#   end
#
#   private
#
#   def stripe(number)
#     puts [space(@branches - number), stars(number)].join
#   end
#
#   def solid(number)
#     puts [space(@branches - number), stars(number * 2)].join
#   end
#
#   def space(count)
#     ' ' * count
#   end
#
#   def stars(count)
#     '*' * count
#   end
# end

# Tree.draw(10, :solid)
# Tree.draw(4, :stripe)








#1. initializer.  2. metordy Klasowe (jest ich mniej) 3. Metody Instancyjne