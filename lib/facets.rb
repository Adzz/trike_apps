class Facets
  def initialize(trait_string)
    @trait = trait_string.split(/\n/)
  end

  def generate
    {
      trait_name => {
        "Overall Score" => score_for(trait[1]),
        "Facets" => facets
      }
    }
  end

  private
  attr_reader :trait

  def trait_name
    trait.first
  end

  def facets
    trait[2..-1].map.with_object({}) do |facet_string, hash|
      hash[facet_name_for(facet_string)] = score_for(facet_string)
    end
  end

  def facet_name_for(string)
    string.delete("^a-zA-Z-\s")
  end

  def score_for(string)
    string.delete("^0-9").to_i
  end
end
