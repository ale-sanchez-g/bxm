require 'rest-client'
require 'csv'
require 'yaml'

module Bxm
#
  #Password class allows the user to create a password using (n) number of random words
  #  from some of the most common words used in the english language
  #  current version only supports english but a plan to support other languages will be available in the future
  # Example:
  #      Bxm::Password.rand_key(4,words)
  # => "74CloudRedRedRed"
  #      Bxm::Password.rand_key(4,palabras)
  # => "57SemanaCasoEstupendoHecho"
  #      Bxm::Password.rand_key(4,wort)
  # => "90RegierungHandWocheAuge"
  #
  class Password
      def self.rand_key(n=1,leng='words',name='names')

        lib = File.expand_path(File.dirname(__FILE__), "words.csv")
        wrds=CSV.read(lib+"/#{leng}.csv")
        nms=CSV.read(lib+"/#{name}.csv")

        super_key = [*('0'..'9')].shuffle[0,2].join
        super_key = super_key + '-' + [*(nms)].shuffle[0,1].join.capitalize

        for i in 2..n
          super_key = super_key + '-' + [*(wrds)].shuffle[0,1].join.capitalize
        end
        return super_key
      end
    end
end