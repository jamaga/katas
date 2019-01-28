class CustomDB
  def self.all
    @all ||= {
      'cars' => {
        '1' => {'color' => 'rEd', 'brand' => 'Audi'},
      },
      'users' => {
          '1' => { 'name' => 'Some name'}
      }
    }
  end

  def self.create(model, opts)
    key = send("#{model}_increment").to_s
    @all[model][key] = { 'color' => opts[:color], 'brand' => opts[:brand] }
  end

  def self.update(model, id, opts)
    @all[model][id] = { 'color' => opts[:color], 'brand' => opts[:brand] }
  end

  #inkrementacja dla usera nnapisac i edytowanie i dodawanie userow  !!!!! - przyklad samochody, nie kopiowac


  def self.cars_auto_id
    @cars_auto_id ||= all['cars'].size
  end

  def self.cars_increment
    @cars_auto_id = self.cars_auto_id + 1
  end
end