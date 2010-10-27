Jake is a simple ruby DSL around java standard compilation and packaging tools
`javac` and `jar`.

Instalation
-----------

   gem install javajake

Compilation
-----------

    Javac.in(SOME_DIR).execute do |javac|
      javac.src = 'src/**/*.java'
      javac.cp << 'libs/**/*.jar'
      javac.output = 'bin'
    end

Manifest
--------

    Manifest.in(SOME_DIR).execute do |manifest|
      manifest.main_class = "my.main.Class"
      manifest.cp = 'libs/**/*.jar'
    end

Packaging
---------

    Jar.in(SOME_DIR).execute do |jar|
      jar.name = 'myjar.jar'
      jar.bin << 'bin'
      jar.with_manifest = true
    end
