# Napisz gre Papier Kamien Nozyce, wartosci które przyjmuje klasa to:
# player1 i player2
# dopuszczalne wartosci to : rock, paper, scissors
# ---------- OUTPUT
# 'Gracz 1 wygrał'
# 'Gracz 2 wygrał'
# 'Remis'
# 'Błędne informacje'

class Game
  def self.play(player1, player2)
    new(player1, player2).play
  end

  #we wszystkich metodach instancyjnych mam dostep do player1 i player2 (zmiennych instancyjnych)
  def play
    case [@player1,@player2].join(';')
      when 'rock;paper' then puts 'Gracz 2 wygrał'
      when 'rock;scissors' then puts 'Gracz 1 wygrał'
      when 'scissors;rock' then puts 'Gracz 2 wygrał'
      when 'scissors;paper' then puts 'Gracz 1 wygrał'
      when 'paper;scissors' then puts 'Gracz 2 wygrał'
      when 'paper;rock' then puts 'Gracz 1 wygrał'
      when 'paper;paper' then puts 'Remis'
      when 'rock;rock' then puts 'Remis'
      when 'scissors;scissors' then puts 'Remis'
      else
        puts 'Błędne informacje'
    end
  end

  private

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
end


# def how(val)
#   case val
#     when 1 then puts 'one'
#     when 2 then puts 'two'
#     else
#       puts 'sth else'
#     end
#   end
# end

Game.play('rock', 'scissors')
# =>