module MongoEnum
    # Takes application-scope value and converts it to how it would be
    # stored in the database. Converts invalid values to nil.
    def mongoize(object)
      mapping[object]
    end
  
    # Get the value as it was stored in the database, and convert to
    # application-scope value. Converts invalid values to nil.
    def demongoize(object)
      inverse_mapping[object]
    end
  
    # Converts the object that was supplied to a criteria and converts it
    # into a query-friendly form. Returns invalid values as is.
    def evolve(object)
      mapping.fetch(object, object)
    end
  
    def mapping
      @mapping ||= self.const_get(:MAPPING).freeze
    end
  
    def inverse_mapping
      @inverse_mapping ||= mapping.invert.freeze
    end
  end