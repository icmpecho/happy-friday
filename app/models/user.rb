class User
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer

  def self.min_weight
  	self.all.asc(:weight).first.weight
  end

end
