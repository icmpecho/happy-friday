class FoodFinderTeam
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer
  has_many :members, class_name: 'User'
  has_many :foods

  def self.max_weight
    return 0 if FoodFinderTeam.count <= 0
    FoodFinderTeam.desc(:weight).first.weight
  end

  def delivered!
    if self.weight != self.class.max_weight
        self.weight = self.class.max_weight + 1 
        self.save
    end
  end
end
