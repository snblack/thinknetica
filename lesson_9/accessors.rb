
class Accessesors
  @@history_value = {}

  def self.attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        if @@history_value.values.last != nil
          if value != @history_value.values.last
            @history_value[var_name] = value
          end
        end
        instance_variable_set(var_name, value)
      end
    end
  end

  def self.view
    @@history_value
  end
end




class Test
  extend MyAttrAccessor

  my_attr_accessor :my_attr, :a, :b, :c
end
