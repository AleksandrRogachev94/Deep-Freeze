class Object

  def deep_freeze

    #  Recursive calling #deep_freeze for enumerable objects.
     if self.respond_to? :each
       self.each { |val| val.deep_freeze }
     end

    #  Freezing of all instance variable values.
    self.instance_variables.each do |var|
      frozen_var = self.instance_variable_get(var)
      frozen_var.deep_freeze
      self.instance_variable_set(var, frozen_var)
    end

    self.freeze # Freezing of an element
  end # End of #deep_freeze
end # End of Object class.
