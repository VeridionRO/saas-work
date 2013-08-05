class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    history = attr_name+"_history"
    attr_reader attr_name        # create the attribute's getter
    attr_reader  history# create bar_history getter\
    class_eval %Q(
    def #{attr_name}=(attr_name)
      @#{attr_name} = attr_name
      if instance_variable_defined? "@#{attr_name}_history"
        @#{attr_name}_history << attr_name
      else
        @#{attr_name}_history = [nil, attr_name]
      end
    end
   )
  end
end

class Foo
  attr_accessor_with_history :bar
end