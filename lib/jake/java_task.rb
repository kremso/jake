class JavaTask
  attr_accessor :base_dir

  def self.in(base_dir = '.')
    self.new(base_dir)
  end

  def execute &block
    yield self

    in_path @base_dir do
      command
    end
  end

  private

  def initialize(path)
    @base_dir = path
  end

  def in_path(path, &block)
    original_path = Dir.getwd

    Dir.chdir(path)
    command = yield
    sh command unless command.nil?
    Dir.chdir(original_path)
  end
end
