require_relative '../lib/big_five_results_text_serializer.rb'

RSpec.describe BigFiveResultsTextSerializer do
  let(:text) { File.read('spec/fixtures/text.txt') }

  subject { described_class.new(text) }

  it 'serializes the name' do
    expect(subject.serialize[:NAME]).to eq "Jeff"
  end

  it 'serializes the email' do
    expect(subject.serialize[:EMAIL]).to eq "lancaster28@hotmail.com"
  end
end
