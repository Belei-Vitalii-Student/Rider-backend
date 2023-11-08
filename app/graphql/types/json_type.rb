module Types
  class JsonType < GraphQL::Schema::Scalar
    description "A JSON object"

    def coerce_input(input_value, _context)
      input_value
    end

    def coerce_result(ruby_value, _context)
      ruby_value
    end
  end
end
