class Jar < JavaTask
  attr_accessor :bin, :name, :with_manifest

  def initialize(path)
    @bin = []
    @with_manifest = false
    super(path)
  end

  def command
    inputs = []
    @bin.each do |c|
      inputs << "-C #{c} ."
    end

    if @with_manifest then
      "jar cvmf META-INF/MANIFEST.MF #{@name} #{inputs.join(' ')}"
    else
      "jar cvf #{@name} #{inputs.join(' ')}"
    end
  end
end
