require 'pry'

class CustomError
  def add(column, msg)
    @errors = {} unless defined?(@errors)
    @errors[column] = [] if @errors[column].nil?
    @errors[column] << msg
  end

  def full_messages
    return [] unless present?
    @errors.flat_map do |one_k, msgs|
      msgs.map do |msg|
        [one_k.capitalize, msg.downcase].join(' ')
      end
    end
  end

  def present?
    !@errors.nil? && !@errors.empty?
  end
end

class OwnActiveRecordBase
  DEFAULT_VALIDATES = {
      presence: [],
  }
  VALIDATE_MESSAGES = {
      presence: 'Can not be blank',
  }

  def initialize(parameters = {})
    assign_attributes(parameters)
  end

  def assign_attributes(attributes)
    attributes.each do |column, value|

      self.class.send(:define_method, column) do
        instance_variable_get("@#{column}")
      end

      self.class.send(:define_method, "#{column}=")  do |val|
        instance_variable_set("@#{column}", val)
      end

      instance_variable_set("@#{column}", value)
    end
  end

  def save
    all_validates&.each do |type, arr_columns|
      arr_columns.each do |column|
        if instance_variable_get("@#{column}").nil? || self.send(column).nil? || self.send(column) == ''
          add_error(column, type)
        end
      end
    end
    return false if errors.present?
    # add to DB
    true
  end

  def add_error(column, type)
    errors.add(column, VALIDATE_MESSAGES[type])
  end

  def all_validates
    self.class.instance_variable_get(:@validates)
  end

  def errors
    @errors ||= CustomError.new
  end

  def self.validates(column, options = {presence: true})
    add_validate_for(options.keys.first, column)
  end

  def self.add_validate_for(type, column)
    @validates = DEFAULT_VALIDATES unless defined?(@validates)
    @validates[type] << column
  end

  def self.show_validate_columns_for(type)
    @validates[type]
  end
end


class User < OwnActiveRecordBase
  # validates :email, presence: true
  # validates :password, presence: true
end


u = User.new
# p u.email
# u.email = 'nowy'
# p u.email
# p User.show_validate_columns_for(:presence)

u.save
#
p u.errors.present? # => {email: ['Can not be blank']}
#
p u.errors.full_messages #=> ['Email can not be blank']


#baza danych
#uzyc Singletona -
#najpierrw railsy!

#mam wiedziec jakto DZIALA wszystko!!!!

