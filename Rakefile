require './lib/m_table'

namespace :mtable do
  desc 'Generates a multiplication table for the first `n` prime numbers'
  task :visualize, [:size] do |t, args|
    size = args[:size].to_i

    sequence = MTable::PrimeSequence.new(size: size).to_a
    matrix = MTable::MultiplicationMatrix.new(sequence)

    puts MTable::CliTable.new(matrix).to_s
  end

  desc 'Generates a multiplication table for the first `n` Fibonacci numbers'
  task :fib, [:size] do |t, args|
    size = args[:size].to_i

    sequence = MTable::FibonacciSequence.new(size: size).to_a
    matrix = MTable::MultiplicationMatrix.new(sequence)

    puts MTable::CliTable.new(matrix).to_s
  end
end
