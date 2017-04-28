RSpec.describe BigFiveResultsTextSerializer do
  let(:text) { File.read('spec/fixtures/input_text.txt') }
  subject { described_class.new(text) }

  it 'serializes a given name' do
    expect(subject.serialize["NAME"]).to eq "Huge Jackman"
  end

  it 'serializes the email from the input text' do
    expect(subject.serialize["EMAIL"]).to eq "lancaster28@hotmail.com"
  end

  context 'EXTRAVERSION' do
    let(:extraversion) { subject.serialize["EXTRAVERSION"] }

    it 'serializes overall score' do
      expect(extraversion["Overall Score"]).to eq 68
    end

    context 'Facets' do
      let(:facets) { subject.serialize["EXTRAVERSION"]["Facets"] }

      it 'serializes Friendliness' do
        expect(facets["Friendliness"]).to eq 82
      end

      it 'serializes Gregariousness' do
        expect(facets["Gregariousness"]).to eq 80
      end

      it 'serializes Assertiveness' do
        expect(facets["Assertiveness"]).to eq 44
      end

      it 'serializes Activity Level' do
        expect(facets["Activity Level"]).to eq 88
      end

      it 'serializes Excitement-Seeking' do
        expect(facets["Excitement-Seeking"]).to eq 46
      end

      it 'serializes Cheerfulness' do
        expect(facets["Cheerfulness"]).to eq 27
      end
    end
  end

  context 'AGREEABLENESS' do
    let(:agreeableness) { subject.serialize["AGREEABLENESS"] }

    it 'serializes overall score' do
      expect(agreeableness["Overall Score"]).to eq 57
    end

    context 'Facets' do
      let(:facets) { subject.serialize["AGREEABLENESS"]["Facets"] }

      it 'serializes Trust' do
        expect(facets["Trust"]).to eq 61
      end

      it 'serializes Morality' do
        expect(facets["Morality"]).to eq 50
      end

      it 'serializes Altruism' do
        expect(facets["Altruism"]).to eq 45
      end

      it 'serializes Cooperation' do
        expect(facets["Cooperation"]).to eq 54
      end

      it 'serializes Modesty' do
        expect(facets["Modesty"]).to eq 65
      end

      it 'serializes Sympathy' do
        expect(facets["Sympathy"]).to eq 52
      end
    end
  end

  context 'CONSCIENTIOUSNESS' do
    let(:conscientiousness) { subject.serialize["CONSCIENTIOUSNESS"] }

    it 'serializes overall score' do
      expect(conscientiousness["Overall Score"]).to eq 24
    end

    context 'Facets' do
      let(:facets) { subject.serialize["CONSCIENTIOUSNESS"]["Facets"] }

      it 'serializes Self Efficacy' do
        expect(facets["Self-Efficacy"]).to eq 24
      end

      it 'serializes Orderliness' do
        expect(facets["Orderliness"]).to eq 25
      end

      it 'serializes Dutifulness' do
        expect(facets["Dutifulness"]).to eq 8
      end

      it 'serializes Achievement Striving' do
        expect(facets["Achievement-Striving"]).to eq 56
      end

      it 'serializes Self Discipline' do
        expect(facets["Self-Discipline"]).to eq 36
      end

      it 'serializes Cautiousness' do
        expect(facets["Cautiousness"]).to eq 38
      end
    end
  end

  context 'NEUROTICISM' do
    let(:neuroticism) { subject.serialize["NEUROTICISM"] }

    it 'serializes overall score' do
      expect(neuroticism["Overall Score"]).to eq 50
    end

    context 'Facets' do
      let(:facets) { subject.serialize["NEUROTICISM"]["Facets"] }

      it 'serializes Anxiety' do
        expect(facets["Anxiety"]).to eq 64
      end

      it 'serializes Anger' do
        expect(facets["Anger"]).to eq 60
      end

      it 'serializes Depression' do
        expect(facets["Depression"]).to eq 46
      end

      it 'serializes Self Consciousness' do
        expect(facets["Self-Consciousness"]).to eq 15
      end

      it 'serializes Immoderation' do
        expect(facets["Immoderation"]).to eq 38
      end

      it 'serializes Vulnerability' do
        expect(facets["Vulnerability"]).to eq 77
      end
    end
  end

  context 'OPENNESS TO EXPERIENCE' do
    let(:openness_to_experience) { subject.serialize["OPENNESS TO EXPERIENCE"] }

    it 'serializes overall score' do
      expect(openness_to_experience["Overall Score"]).to eq 48
    end

    context 'Facets' do
      let(:facets) { subject.serialize["OPENNESS TO EXPERIENCE"]["Facets"] }

      it 'serializes Imagination' do
        expect(facets["Imagination"]).to eq 19
      end

      it 'serializes Artistic Interests' do
        expect(facets["Artistic Interests"]).to eq 22
      end

      it 'serializes Emotionality' do
        expect(facets["Emotionality"]).to eq 32
      end

      it 'serializes Adventurousness' do
        expect(facets["Adventurousness"]).to eq 86
      end

      it 'serializes Intellect' do
        expect(facets["Intellect"]).to eq 48
      end

      it 'serializes Liberalism' do
        expect(facets["Liberalism"]).to eq 79
      end
    end
  end

  context 'Adding facets' do
    let(:more_text) do
      "\n"\
      "TEST FACET\n"\
      "Overall Fake Score.....100\n"\
      "this is also totes fake....500\n"\
      "this one is real............7000\n"\
      "this one is real fake............22\n"\
    end

    it 'will handle any number of facets' do
      text << more_text
      expect(subject.serialize['TEST FACET']["Overall Score"]).to be 100
      expect(subject.serialize['TEST FACET']["Facets"]["this is also totes fake"]).to be 500
      expect(subject.serialize['TEST FACET']["Facets"]["this one is real"]).to be 7000
      expect(subject.serialize['TEST FACET']["Facets"]["this one is real fake"]).to be 22
    end
  end
end
