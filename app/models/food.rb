class Food
  include Mongoid::Document
  field :delivered_date, type: Date
  field :content, type: String
  belongs_to :food_finder_team
end
