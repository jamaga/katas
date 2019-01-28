class InvalidPointError < StandardError #prawie kazdy error to STandardError !!! tak moge stworzyc wlasne bledy!!!
  def message
    'Valid value is: val > 0 and val <= 359'
  end
end

class Tower
  RANGE = 120

  def self.add(point)
    fail InvalidPointError if point < 0 || point > 359
    @points = [] if @points.nil?
    @points << point
  end

  def self.points
    @points #to jest GETTER!! setter- cos =
  end
  #
  # def self.towers_count
  #   @points.sort.map do |position|
  #     if (position + RANGE) > 359
  #       (((position..359).to_a + (0..(RANGE - (359 - position))).to_a) & @points).size
  #     else
  #       ((position..(RANGE + position)).to_a & @points).size
  #     end
  #   end.max
  # end

  # { max: 'range'}
  # a = { 3: '350:110', 2: '4:124', 1: '6:126'}
  # a[a.keys.max]

  def self.show_range
    hash = @points.sort.each_with_object({}) do |position, result|
      if (position + RANGE) > 359
        start_range = position
        end_range = RANGE - (360 - position)
        key = (((position..359).to_a + (0..(end_range)).to_a) & @points).size
        result[key] = [start_range, end_range].join(':')
      else
        start_range = position
        end_range = RANGE + position
        key =((position..(end_range)).to_a & @points).size
        result[key] = [start_range, end_range].join(':')
      end
    end
    max = hash.keys.max
    range = hash[max]
    "Max: #{max} - Range: #{range}"
  end
  # 1:121
end

Tower.add(4)
Tower.add(6)
Tower.add(350)
Tower.add(355)
# p Tower.towers_count
p Tower.show_range
# 0-120 =>3
# 1-121 =>4



# stoiz na szcycie gory
# dookola sa latarnie morskie
# masz zasieg widzenia 120 stopni
# musisz zatrzymac sie tak aby widziec jak najwiecej latarni
#
# napisac klase
# ktora
# bedzie sie zachowywala : mam zakresy od 0 do 360
# jedna klasa bedzie przyjmowac polozenie latarni - bede mogla dodawac 5 latarni czy ile chce
#
# wywolanie:
#
#
#
# Lanter.add(5)
# Lanter.add(30) ....
#     Lander.add(400) ->  Exception
# Langer.show => [5,125]