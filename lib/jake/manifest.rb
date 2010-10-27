class Manifest < JavaTask
  attr_accessor :cp, :main_class

  def execute &block
    yield self

    in_path @base_dir do
      FileUtils.mkdir 'META-INF' unless File.exists? 'META-INF'
      @cp = Dir.glob(@cp)

      File.open(File.join('META-INF', 'MANIFEST.MF'), 'w') do |f|
        f.puts 'Manifest-Version: 1.0'
        f.puts 'Class-Path: ' + @cp.join(" \n ").to_s
        f.puts 'Main-Class: ' + @main_class
      end

      nil
    end
  end
end
