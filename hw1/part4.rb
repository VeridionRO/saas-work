class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def name
    return @name
  end

  def name= new_name
    @name = new_name
  end

  def calories
    return @calories
  end

  def calories= new_calories
    @calories = new_calories
  end

  def healthy?
    if @calories < 200
      return true
    end
    return false
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def flavor
    return @flavor
  end

  def flavor= new_flavor
    @flavor = new_flavor
  end

  def delicious?
    if @flavor == "black licorice"
      return false
    end
    return true
  end
end