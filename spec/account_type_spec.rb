require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Zengin::AccountType do
  subject { Zengin::AccountType }

  describe '::ordinary' do
    it 'returns 1' do
      expect(subject.ordinary).to eq(1)
    end
  end

  describe '::current' do
    it 'returns 1' do
      expect(subject.current).to eq(2)
    end
  end

  describe '::saving' do
    it 'returns 1' do
      expect(subject.saving).to eq(4)
    end
  end
end
