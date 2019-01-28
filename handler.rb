require 'net/http'
require 'json'
require 'pry'

class Handler
  def initialize(opts)
    @opts = opts
    @uri = URI.parse('http://localhost:4567')
  end

  def self.call(opts)
    new(opts).call
  end

  def call
    JSON.parse(response.body)
  end

  def response
    http.request(request)
  end

  def request
    send(@opts[:method_name], @opts[:args])
  end

  def index(_args)
    Net::HTTP::Get.new(@opts[:path])
  end

  def create(args)
    Net::HTTP::Post.new(@opts[:path]).tap do |request|
      request.set_form_data(args)
    end
  end

  def http
    Net::HTTP.new(@uri.host, @uri.port)
  end
end # class FirstTransactionDateHandler

class Cars
  def self.all
    Handler.call(path: '/cars', args: {}, method_name: :index)
  end

  def self.add(args)
    Handler.call(path: '/cars', args: args, method_name: :create)
  end
end

puts Cars.all
Cars.add(brand: 'Audi', color: 'white')
puts Cars
