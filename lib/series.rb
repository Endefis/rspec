class Series
  private

  attr_reader :series

  def initialize(series)
    @series = series.chars
  end

  public

  def slices(length)
    unless length <= series.length
      raise ArgumentError, 'Slices length cannot be longer than series length'
    end

    series.each_cons(length).map(&:join)
  end
end
