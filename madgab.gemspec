$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "madgab/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "madgab"
  s.version     = Madgab::VERSION
  s.author      = "Ryan Hall"
  s.email       = "ryan@allegroapps.com"
  s.homepage    = "https://github.com/halloffame/Magdab"
  s.summary     = "Madgab random string generator"
  s.description = "Generates random strings of words that can be used for things like password suggestions."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "README.markdown"]
end
