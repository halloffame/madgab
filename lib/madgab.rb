module Madgab

  # The default string together of values
  DEFAULT_STRING ||= ["the", :adv, :adj, :noun, :verb]

  # The default value to join the words
  DEFAULT_JOIN ||= "_"

  class << self
    # Generates a more random string of words like in the game Mad Gab
    def generate(string_together=DEFAULT_STRING, join_with=DEFAULT_JOIN)
      unless defined? @@diction
        self.diction
      end

      words = string_together.map{|s|
        if s.is_a? String
          s
        elsif s.is_a? Symbol
          retrieve s
        end
      }.join(join_with)
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

    def retrieve(sym)
      begin
        @@diction[sym].sample
      rescue
        "- :#{sym} is not a valid parameter -"
      end
    end
  end
end
