require 'rails_helper'

describe Task do
  context 'Assocations' do
    it { is_expected.to belong_to :team }
  end
end
