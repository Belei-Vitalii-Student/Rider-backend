class Path
  include Mongoid::Document
  include Mongoid::Timestamps

  field :coordinates, type: Array

  belongs_to :user, required: true

  validates_each :coordinates do |record, attr, value|
    if !value.present? || !value.kind_of?(Array)
      record.errors.add(attr, "must contain only lat and lng value")
    end


    value.each do|obj|
      if !obj[:lat].present? || !obj[:lng].present?
        record.errors.add(attr, "must contain only lat and lng value")
      end
    end
  end

end
