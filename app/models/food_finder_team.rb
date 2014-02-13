class FoodFinderTeam
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer
  has_many :members, class_name: 'User'

  def self.max_weight
    FoodFinderTeam.desc(:weight).first.weight
  end

  def delivered!
    self.weight = self.class.max_weight + 1
  end
end
