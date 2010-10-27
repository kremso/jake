class UnJar < JavaTask
  attr_accessor :name, :target

  def command
      "unzip -n #{@name} -d #{@target}"
  end
end
