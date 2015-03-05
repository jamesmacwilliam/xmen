require 'rails_helper'

describe Team do
  context 'Associations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of   :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
