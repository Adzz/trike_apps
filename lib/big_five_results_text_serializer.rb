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
