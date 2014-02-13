class FoodFinderTeam
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer
  has_many :members, class_name: 'User'

  def self.max_weight
    FoodFinderTeam.desc(:weight).first.weight
  end

  def delivered!
    if self.weight != self.class.max_weight
        self.weight = self.class.max_weight + 1 
        self.save
    end
  end
end
