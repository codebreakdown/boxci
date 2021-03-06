require 'spec_helper'

describe Boxci::ConfigPermutationComponent do
  subject { Boxci::ConfigPermutationComponent }

  describe '#initialize' do
    it 'assigns the given value to an instance variable' do
      config_permutation_component = subject.new('foeue')
      expect(config_permutation_component.instance_variable_get(:@val)).to eq('foeue')
    end
  end

  describe '#switch_to_script' do
    it 'raises exception stating it is pure virtual method' do
      config_permutation_component = subject.new('foeue')
      expect { config_permutation_component.switch_to_script }.to raise_error(Boxci::PureVirtualMethod)
    end
  end
end
