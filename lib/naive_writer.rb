require 'tempfile'
module NaiveWriter extend self
  def write(batches:, lines:)
    ::Tempfile.new("naive").tap do |file|
      batches.times(&write_batch(lines: lines, file: file))
    end
  end


  private

  def write_batch(lines:, file:)
    -> * do
      lines.each do |line|
        file.puts(line)
      end
      file.flush
    end
  end
end
