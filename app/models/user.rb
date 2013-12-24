class User
  include Mongoid::Document
  include DateHelper
  field :name, type: String
  field :weight, type: Integer

  def self.min_weight
  	self.all.asc(:weight).first.weight
  end

  def self.max_weight
  	self.all.desc(:weight).first.weight
  end

  def next_talk
  	weeks = self.weight - self.class.min_weight
  	self.next_friday(weeks)
  end

end
