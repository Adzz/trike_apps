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
    trait_strings.map do |trait|
       {
        trait.split(/\n/).first => {
          'Overall Score' => score(trait.split(/\n/)[1]),
          'Facets' => facets(trait.split(/\n/))
        }
      }
    end
  end

  def facets(trait)
    trait.drop(2).map.with_object({}) do |facet_string, hash|
      hash[title(facet_string)] = score(facet_string)
    end
  end

  def title(string)
    string.delete("^a-zA-Z|\s")
  end

  def score(string)
    string.delete("^0-9").to_i
  end
end
