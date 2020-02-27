require 'benchmark'
require 'securerandom'
require_relative 'lib/naive_writer'
require_relative 'lib/smart_writer'

LINE_LENGTH = 120
BLOCK       = 1000.times.map{ SecureRandom.alphanumeric(LINE_LENGTH) }
BATCHES     = 1000

RUNS        = 10

Benchmark.bm(RUNS) do |reporter|
  reporter.report("naive:") { NaiveWriter.write(lines: BLOCK, batches: BATCHES).unlink }
  reporter.report("smart:") { SmartWriter.write(lines: BLOCK, batches: BATCHES).unlink }
end
