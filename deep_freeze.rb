class Object

  def deep_freeze

    #  Recursive calling #deep_freeze for enumerable objects.
     if self.respond_to? :each
       self.each { |val| val.deep_freeze }
     end

    #  Freezing of all instance variable values.
    self.instance_variables.each do |var|
      frozen_val = self.instance_variable_get(var)
      frozen_val.deep_freeze
      self.instance_variable_set(var, frozen_val)
    end

    self.freeze # Freezing of an element
  end # End of #deep_freeze

  def deep_frozen?
    #  Recursive calling #deep_freeze for enumerable objects.
    if self.respond_to? :each
      self.each { |val| val.deep_frozen? }
    end

    #  #frozen? for all instance variable values.
    flag = self.frozen?
    if flag == true
      flag = self.instance_variables.all? do |var|
        val = self.instance_variable_get(var)
        val.frozen?
      end
    end
    fl # returning flag.
  end
end # End of Object class.
