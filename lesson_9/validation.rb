module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *arg)
      @validators ||= []
      @validators << { name: name, type: type, arg: arg }
    end
  end
​
  module InstanceMethods
    def validate!
      self.class.instance_variable_get(:validators).each do |validator|
        variable = self.instance_variable_get(validator[:name])
        send("validate_#{validator[:type]}", name, validator[:arg])
      end
    end
​
    def validate_presence(name, type)
       raise "Значение атрибута пустое" if name == nil
    end

    def validate_format(name, arg)
      raise "Значение атрибута не соответствует
      регулярному выражению" if name !~ arg
    end

    def validate_type(name, type, arg)
      raise "Объект не соответсвует классу" if name.class != arg
    end

    def valid?
      validate_presence
      validate_format
      validate_type
    rescue
      False
    end
  end
end
