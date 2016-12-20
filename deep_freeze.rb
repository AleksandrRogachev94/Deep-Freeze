class Object

  def deep_freeze

    #  Recursive calling #deep_freeze for enumerable objects.
    if self.respond_to? :each
      if self.class == Hash
        self.each { |key, val| val.deep_freeze }
      else
        self.each { |val| val.deep_freeze }
      end
    end

    #  Freezing of all instance variable values.
    self.instance_variables.each do |var|
      frozen_val = self.instance_variable_get(var)
      frozen_val.deep_freeze
      self.instance_variable_set(var, frozen_val)
    end

    self.freeze unless self.frozen? # Freezing of an element.
  end # End of #deep_freeze

  def deep_frozen?

    #  Recursive calling #deep_freeze for enumerable objects.
    if self.respond_to? :each
      if self.class == Hash
        flag = self.all? { |key, val| val.deep_frozen? }
      else
        flag = self.all? { |val| val.deep_frozen? }
      end
    else
      flag = true
    end

    #  #frozen? for all instance variable values.
    flag = self.frozen? if flag
    if flag == true
      flag = self.instance_variables.all? do |var|
        val = self.instance_variable_get(var)
        val.deep_frozen?
      end
    end
    flag # returning flag.
  end
end # End of Object class.
