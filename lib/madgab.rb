module Madgab

  class << self
    # Generates a more random string of words like in the game Mad Gab
    def generate
      unless defined? @@diction
        self.diction
      end

      words = ["the", adv, adj, noun, verb].join('_')
    end

    # Sets the dictionaries
    def diction
      @@diction = Hash.new
      openpath = File.dirname(__FILE__) + '/madgab/dictionaries/'
      @@diction[:adj] = IO.readlines(openpath + 'adj.csv').map {|v| v.strip }
      @@diction[:adv] = IO.readlines(openpath + 'adv.csv').map {|v| v.strip }
      @@diction[:noun] = IO.readlines(openpath + 'noun.csv').map {|v| v.strip }
      @@diction[:verb] = IO.readlines(openpath + 'verb.csv').map {|v| v.strip }
    end

    private

    def adj
      @@diction[:adj].sample
    end
    def adv
      @@diction[:adv].sample
    end
    def noun
      @@diction[:noun].sample
    end
    def verb
      @@diction[:verb].sample
    end

  end
end
