require 'tempfile'
module SmartWriter extend self
  def write(batches:, lines:)
    ::Tempfile.new("smart").tap do |file|
      batches.times(&write_batch(lines: lines, file: file))
    end
  end


  private

  def write_batch(lines:, file:)
    -> * do
      file.puts(lines.join("\n"))
      file.flush
    end
  end
end
