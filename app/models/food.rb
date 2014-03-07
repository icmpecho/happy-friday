class Food
  include Mongoid::Document
  field :delivered_date, type: Date
  field :content, type: String
end
