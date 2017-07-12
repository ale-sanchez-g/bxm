require 'csv'
require 'yaml'

module Bxm
#
  #Password class allows the user to create a password using (n) number of random words
  #  from some of the most common words used in the english language
  #  current version only supports english but a plan to support other languages will be available in the future
  # Example:
  #      Bxm::Password.rand_key(4,words)
  # => "50-Joshua-Thing-Work-First"
  #      Bxm::Password.rand_key(4,palabras)
  # => "86-Joseph-Diferente-Gran-Siguiente"
  #      Bxm::Password.rand_key(4,worts)
  # => "69-Harry-Alt-Arbeiten-Weg"
  #
  class Password
      def self.rand_key(n=1,leng='words', special=false)

        lib = File.expand_path(File.dirname(__FILE__), "words.csv")
        wrds=CSV.read(lib+"/#{leng}.csv")
        nms=CSV.read(lib+"/names.csv")
        spcl=CSV.read(lib+"/special.csv")

        super_key = [*('0'..'9')].shuffle[0,2].join
        super_key = super_key + '-' + [*(nms)].shuffle[0,1].join.capitalize

        for i in 2..n
          super_key = super_key + '-' + [*(wrds)].shuffle[0,1].join.capitalize
        end

        if special == true
          for b in 1..n
            super_key = super_key.sub! '-', [*(spcl)].shuffle[0,1].join
          end
          return super_key
        else
          return super_key
        end
      end
    end
end