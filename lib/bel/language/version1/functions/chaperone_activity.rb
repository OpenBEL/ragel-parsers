require_relative '../../function'
require_relative '../return_types/abundance'

module BEL
  module Language
    module Version1
      module Functions
        # ChaperoneActivity
        class ChaperoneActivity
          include BEL::Language::Version1
          extend Function

          SHORT       = :chap
          LONG        = :chaperoneActivity
          RETURN_TYPE = ReturnTypes::Abundance
          DESCRIPTION = 'Denotes the frequency or abundance of events
  in which a member binds to some substrate and acts as a chaperone for
  the substrate'.freeze
          SIGNATURES  = [].freeze

          def self.short
            SHORT
          end

          def self.long
            LONG
          end

          def self.return_type
            RETURN_TYPE
          end

          def self.description
            DESCRIPTION
          end

          def self.signatures
            SIGNATURES
          end
        end
      end
    end
  end
end
