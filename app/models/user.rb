class User
  include Mongoid::Document
  include DateHelper
  field :name, type: String
  field :weight, type: Integer
  # auth info
  field :provider, :type => String
  field :uid, :type => String
  field :email, :type => String

  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth['provider']
	    user.uid = auth['uid']
	    user.weight = self.max_weight + 1;
	    if auth['info']
	       user.name = auth['info']['name'] || ""
	       user.email = auth['info']['email'] || ""
	    end
	  end
	end

  def self.min_weight
  	if self.all.count > 0
  		self.all.asc(:weight).first.weight
 		else
  		0
  	end
  end

  def self.max_weight
  	if self.all.count > 0
  		self.all.desc(:weight).first.weight
  	else
  		0
  	end
  end

  def self.create_weight_slot!(target_weight)
  	self.where(:weight.lte => target_weight).asc(:weight).each do |user|
  		user.weight = user.weight - 1
  		user.save
  	end
  end

  def next_talk
  	weeks = self.class.where(:weight.lt => self.weight).count
  	self.next_friday(weeks)
  end

  def volunteer!(weeks=0)
  	target_weight = self.class.asc(:weight).skip(weeks).first.weight
  	if(self.weight != target_weight)
  		self.class.create_weight_slot!(target_weight - 1)
  		self.weight = target_weight - 1
  		self.save
  	end
  end

  def as_json(options)
  	super( :methods => [:next_talk] )
  end

end
