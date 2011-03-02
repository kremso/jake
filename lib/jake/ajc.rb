class Ajc < JavaTask
  attr_accessor :src, :cp, :outjar, :inpath, :rt # rt must be aspectJ runtime

  def initialize(path)
    super(path)
    @cp = []
  end

  def command
    classpath = []
		classpath << @rt
		inpath_arr = []

    @src = Dir.glob(@src)
    @cp.each do |p|
      puts "Globbing #{p}"
      classpath << Dir.glob(p)
      puts "CP = #{classpath}"
    end
    @inpath.each do |p|
      puts "Globbing #{p}"
      inpath_arr << Dir.glob(p)
      puts "inpath = #{inpath_arr}"
    end

    "ajc -cp " + classpath.join(cp_separator).to_s + " -inpath " + inpath_arr.join(cp_separator).to_s + " -outjar " + @outjar + " -1.5 "  + @src.join(' ').to_s
  end
	
end
