class BigFiveResultsTextSerializer
  def initialize(text)
    @text = text
  end

  def serialize
    traits.reduce(Hash.new, :merge).merge(name).merge(email)
  end

  private

  attr_reader :text

  def trait_strings
    text.split(/\n\n/).drop(1)
  end

  def name
    { "NAME" => text.split(/\n/)[0].split(' ')[1..-1].join(' ') }
  end

  def email
    { "EMAIL" => text.split(/\n/)[1].split(' ').last }
  end

  def traits
    trait_strings.map do |trait_string|
      Facets.new(trait_string).generate
    end
  end
end

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
    string.delete("^a-zA-Z|\s")
  end

  def score_for(string)
    string.delete("^0-9").to_i
  end
end
