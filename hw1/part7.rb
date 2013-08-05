class CartesianProduct
  include Enumerable
  def initialize(iterator1, iterator2)
    @iterator1 = iterator1
    @iterator2 = iterator2
  end

  def each
    [@iterator1.each{
      |value|
      @iterator2.each{
      |value2| [value, value2]
      }
      }]
  end

  def each(&block)
    Enumerator.new do |y|
      @iterator1.each {
        |value|
        @iterator2.each{
          |value2| y << [value, value2]
        }
      }
    end.each(&block)
  end
end
  
def mystery_sequence(start1, start2, limit=4)
      yield start1
      yield start2
      nextval = start1 + start2
      1.upto(limit) do
        yield nextval
        nextval, start2 = nextval + start2, nextval
      end
    end

    s = []
mystery_sequence(2,3) do |elt| ; s<<elt; end