# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def create_variable_instances
      @instances = 0
    end

    def instances
      @instances
    end

    def insta
      @instances += 1
      puts @instances
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.insta
    end
  end
end
