require 'pry'

class BigFiveResultsTextSerializer
  def initialize(text)
    @text = text
  end

  def serialize
    {
      "NAME" => name,
      "EMAIL" => email,
      "EXTRAVERSION" => rest[0],
      "AGREEABLENESS" => rest[1],
      "CONSCIENTIOUSNESS" => rest[2],
      "NEUROTICISM" => rest[3],
      "OPENNESS TO EXPERIENCE" => rest[4],
    }
  end

  private

  attr_reader :text

  def traits
    text.split(/\n\n/).drop(1)
  end

  def name
    text.split(/\n/)[0].split(' ')[1..-1].join(' ')
  end

  def email
    text.split(/\n/)[1].split(' ').last
  end

  def rest
    traits.map do |trait|
      trait.split(/\n/).drop(1).map.with_object({}) do |trait_string, hash|
        hash[trait_string.delete("^a-zA-Z|\s")] = trait_string.delete("^0-9").to_i
      end
    end
  end
end

# probably abstract out the delimiting logic somewhere?
