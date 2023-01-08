# frozen_string_literal: true

class WordMachine
  MAPPING = {
    POP: :pop,
    DUP: :dup,
    '+': :add,
    '-': :sub
  }.freeze

  attr_reader :errors

  def initialize
    @stack = []
    @errors = []
  end

  def process(str)
    raise ArgumentError, 'empty string' if str.strip.empty?

    @stack = []

    str.split(/ +/).each do |text|
      if numeric?(text)
        process_number(text)
      else
        process_operator(text)
      end
    end

    pop
  rescue ArgumentError, RuntimeError => e
    errors << e.message
    -1
  end

  private

  attr_reader :stack

  def numeric?(text)
    text.match?(/^\d+$/)
  end

  def process_number(num)
    push(num.to_i)
  end

  def operator?(text)
    MAPPING.keys.include? text.to_sym
  end

  def process_operator(operator)
    action = MAPPING[operator.to_sym]
    raise ArgumentError, "no such operator: #{operator}" unless action

    send(action)
  end

  def check_range(num)
    raise ArgumentError, "#{num} is out of range" if num.negative? || num >= 2.pow(20)
  end

  def check_remaining(count)
    raise "remaining elements less than #{count}" if stack.size < count
  end

  def push(num)
    check_range(num)
    stack.push(num)
  end

  def pop
    check_remaining(1)

    stack.pop
  end

  def dup
    check_remaining(1)

    stack.push(stack.last)
  end

  def add
    check_remaining(2)

    num1 = stack.pop
    num2 = stack.pop
    push(num1 + num2)
  end

  def sub
    check_remaining(2)
    num1 = stack.pop
    num2 = stack.pop
    push(num1 - num2)
  end
end
