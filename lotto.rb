class Kupon
  def self.create(*args) #dzieki *  - jest Arrayem!!!! ** - to hash - jak podam hash w wywolaniu i mam dwie gwiazdki - to bedzie hash
    fail 'Za mało liczb' if args.count < 6 # fail - zatrrzyma program a jakbym zorbila printa to nie zatrzyma programu!
    {
        numbers: args[0..5],
        lucky: args[6],
    }
  end
end

class Lotto

  def initialize(kupon)
    @kupon = kupon
  end

  def self.run(kupon)
    new(kupon).run
  end

  def run
    if calc_prize > 0
      puts "gratulacje wygrales #{calc_prize}"
    else
      puts 'buuuuu'
    end
  end

  private

  def calc_prize
    result.count * 10 + (lucky? ? 100 : 0)
  end

  def all_numbers
    @all_numbers ||= (1..49).to_a.shuffle  # memoization ( caching ) - wartosc po prawej stronie wywola sie tylko raz  W DANYM OBIEKCIE i przypisze sie do zmiennej isntancyjnej - kazda metoda ktora ma zatrzymac wartosc- memoization
  end

  def six_numbers
    all_numbers[0..5]
  end

  def lucky_number
    all_numbers.last
  end

  def result
    @result ||= six_numbers & @kupon[:numbers]
  end

  def lucky?
    @lucky_number ||= six_numbers.include?(@kupon[:lucky])
  end
end

kupon = Kupon.create(1,4,5,7,23,44,15)
Lotto.run(kupon)

# obsluzyc 2 wywolania:
Lotto.run([1,4,5,7,23,44], 12)      #- drugi parametr JEST OPCJONALNY czyli =nil
Lotto.run([1,4,5,7,23,44])