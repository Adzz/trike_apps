require_relative '../lib/big_five_results_text_serializer.rb'

RSpec.describe BigFiveResultsTextSerializer do
  let(:text) { File.read('spec/fixtures/input_text.txt') }

  subject { described_class.new(text) }

  it 'serializes a given name' do
    expect(subject.serialize[:NAME]).to eq "Huge Jackman"
  end

  it 'serializes the email from the input text' do
    expect(subject.serialize[:EMAIL]).to eq "lancaster28@hotmail.com"
  end

  context 'EXTRAVERSION' do
    let(:extraversion) { subject.serialize[:EXTRAVERSION] }

    it 'serializes overall score' do
      expect(extraversion['Overall score']).to eq 68
    end

    it 'serializes Friendliness' do
      expect(extraversion['Friendliness']).to eq 82
    end

    it 'serializes Gregariousness' do
      expect(extraversion['Gregariousness']).to eq 80
    end
  end
end
