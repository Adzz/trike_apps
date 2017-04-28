RSpec.describe BigFiveResultsPoster do
  subject { described_class.new({ test: :results }) }

  before do
    allow_any_instance_of(Net::HTTP).to receive(:request).and_return(response_double)
  end

  context 'success' do
    let!(:response_double) do
      Struct.new(:code) do
        def code
          "201"
        end

        def body
          123
        end
      end.new
    end

    it 'returns true if post was successful' do
      expect(subject.post).to eq true
    end
  end

  context 'failure' do
    let!(:response_double) do
      Struct.new(:code) do
        def code
          "400"
        end

        def body
        end
      end.new
    end

    it 'returns false if post was unsuccessful' do
      expect(subject.post).to eq false
    end
  end
end
