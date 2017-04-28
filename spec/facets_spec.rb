RSpec.describe Facets do
  describe "#generate" do
    let(:trait_string) do
      "AGREEABLENESS\n"\
      "Overall Score............57\n"\
      "Trust....................61\n"\
      "Morality.................50\n"\
      "Altruism.................45\n"\
      "Cooperation..............54\n"\
      "Modesty..................65\n"\
      "Sympathy.................52"
    end

    subject { Facets.new(trait_string) }
    let(:result) do
      {
        "AGREEABLENESS" => {
          "Overall Score" => 57,
          "Facets" => {
            "Trust" => 61,
            "Morality" => 50,
            "Altruism" => 45,
            "Cooperation" => 54,
            "Modesty" => 65,
            "Sympathy" => 52,
          }
        }
      }
    end

    it 'generates a hash correctly' do
      expect(subject.generate).to eq result
    end
  end
end
