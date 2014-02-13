class FoodFinderTeam
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer
  has_many :members, class_name: 'User'
end
