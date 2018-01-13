require './lib/m_table'

namespace :mtable do
  desc 'Generates a multiplication table for the first `n` prime numbers'
  task :visualize, [:size] do |t, args|
    size = args[:size].to_i

    sequence = MTable::PrimeSequence.new(size: size).to_a

    puts MTable::CliTable.new(sequence).to_s
  end
end
