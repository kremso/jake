class Javac < JavaTask
  attr_accessor :src, :cp, :output

  def initialize(path)
    super(path)
    @cp = []
  end

  def command
    classpath = []

    @src = Dir.glob(@src)
    @cp.each do |p|
      puts "Globbing #{p}"
      classpath << Dir.glob(p)
      puts "CP = #{classpath}"
    end

    FileUtils.mkdir_p(@output) unless File.exist? @output
      "javac " + @src.join(' ').to_s + " -cp " + classpath.join(cp_separator).to_s + " -d " + @output
  end

  private

  def cp_separator
    if RUBY_PLATFORM =~ /(win|w)32$/
      ';'
    else
      ':'
    end
  end
end
