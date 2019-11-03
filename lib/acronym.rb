

class Acronym
  def self.abbreviate(input)
    words = input.scan(/\b[a-zA-Z]/).join.upcase
  end
end
