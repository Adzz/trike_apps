class BigFiveResultsTextSerializer
  def initialize(text)
    @text = text
  end

  def serialize
    {
      NAME: name,
      EMAIL: email,
    }
  end

  private

  attr_reader :text

  def name
    "Jeff"
  end

  def email
    "lancaster28@hotmail.com"
  end
end
