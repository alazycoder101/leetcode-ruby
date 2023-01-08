# frozen_string_literal: true

require 'spec_helper'
require 'word_machine'

describe WordMachine do
  let (:machine) { described_class.new }

  describe '#process' do
    it '-1 for empty' do
      expect(machine.process('')).to eql(-1)
    end

    it '-1 for only operator' do
      expect(machine.process('+')).to eql(-1)
      expect(machine.process('-')).to eql(-1)
      expect(machine.process('POP')).to eql(-1)
      expect(machine.process('DUP')).to eql(-1)
    end

    it '-1 for less than 2' do
      expect(machine.process('1 +')).to eql(-1)
      expect(machine.process('2 -')).to eql(-1)
      expect(machine.process('5 6 + -')).to eql(-1)
    end

    it '-1 for nothing left' do
      expect(machine.process('1 2 POP POP')).to eql(-1)
      expect(machine.process('1 POP POP')).to eql(-1)
    end

    it '-1 for result < 0' do
      expect(machine.process('15 10 -')).to eql(-1)
    end

    it 'check range' do
      expect(machine.process('1048575 DUP +')).to eql(-1)
      expect(machine.process('1048576')).to eql(-1)
      expect(machine.process('-1 DUP +')).to eql(-1)
      expect(machine.process('0')).to eql(-1)
    end

    it 'returns corret number' do
      expect(machine.process('4 5 6 - 7 +')).to eql(8)
      expect(machine.process('13 DUP 4 POP 5 DUP + DUP + -')).to eql(7)
    end
  end
end
