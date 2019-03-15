
# Napisz zadanie które będzie przyjmowac hash (first_name, last_name, profession)
# i wypisywać tekst na podstawie tych wartosci z hasha np:
# 'Nazywam się (xxxx), jestem (xxxxxx)'
# jeżeli któraś wartość nie wystąpi to powinien być zwrócony nil.


class Sentence

  # def initialize(opts)  # jak sie przekazuje hash - to sa OPTS - 'options'
  #   @opts = opts
  # end

  def self.call(opts)
    # return unless [opts[:first_name], opts[:last_name], opts[:profession]].all? #metoda all? - sprawdza czy wszystkie elemety ktore w arrayu napisalismy ISTNIEJA - jak bedzie gdzies nil to all? rzuci false
    puts "Nazywam sie #{opts.fetch(:first_name)} #{opts.fetch(:last_name)}, jestem #{opts.fetch(:profession)}"
  rescue
    #send notification ( email )
    #run logger ( with ERROR )
    raise CustomError
  end
  #rescue - uzywam zeby obsluzyc exception czyli cos co by mi rozwalilo program
  # fail to to samo co raise - tylko faila uzywamy poza rescue (konwencja)



end

Sentence.call(last_name: 'aga', profession: 'gardener') # ta samo sie zacowuje jakbym napisala hash w seodku!
#jak nie wiem jakiej nazwy uzyc - uzywac 'call'

#monkey patching - nadpisywanie klas
# jak sie uzywa np biblioteki zewnetrnej - i chcemy ulepszyc sobie klase - to nadpisujemy
# zla praktyka - lepiej pisac klasy ktore beda robic to co my chcemy.
