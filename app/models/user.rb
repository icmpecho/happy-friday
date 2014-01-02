class User
  include Mongoid::Document
  include DateHelper
  field :name, type: String
  field :nickname, type: String
  field :team, type: String
  field :weight, type: Integer
  field :active, type: Boolean
  has_many :talks
  # auth info
  field :provider, :type => String
  field :uid, :type => String
  field :email, :type => String

  validates :name, uniqueness: true
  validates :uid, uniqueness: { scope: :provider }
  validates :email, uniqueness: true

  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth['provider']
	    user.uid = auth['uid']
	    user.weight = self.max_weight + 1;
      user.active = true
	    if auth['info']
	       user.name = auth['info']['name'] || ""
	       user.email = auth['info']['email'] || ""
	    end
	  end
	end

  def self.speakers
    self.where(active: true).asc(:weight)
  end

  def self.min_weight
  	if self.speakers.count > 0
  		self.speakers.asc(:weight).first.weight
 		else
  		0
  	end
  end

  def self.max_weight
  	if self.speakers.count > 0
  		self.speakers.desc(:weight).first.weight
  	else
  		0
  	end
  end

  def self.create_weight_slot!(target_weight)
  	self.speakers.where(:weight.lte => target_weight).asc(:weight).each do |user|
  		user.weight = user.weight - 1
  		user.save
  	end
  end

  def next_talk
    if(!self.active)
      return false
    end
  	weeks = self.class.speakers.where(:weight.lt => self.weight).count
    total_weeks = weeks
    last_skips = 0;
    skips = nil;
    while skips != last_skips do
      dates = []
      (0..total_weeks).each do |week|
        date = self.next_friday(week)
        dates << date
      end
      last_skips = skips;
      skips = NoTechtalkDay.in(date: dates).count
      total_weeks = weeks + skips
    end
  	self.next_friday(total_weeks)
  end

  def volunteer!(weeks=0)
    if(!self.active)
      return false
    end
  	target_weight = self.class.speakers.skip(weeks).first.weight
  	if(target_weight >= self.weight)
  		return false
  	end
  	if(self.weight != target_weight)
  		self.class.create_weight_slot!(target_weight - 1)
  		self.weight = target_weight - 1
  		self.save
  	end
  	return true
  end

  def talked!
    if(!self.active)
      return false
    end
  	if self.weight != self.class.max_weight
  		self.weight = self.class.max_weight + 1
  		self.save
  	end
  end

  def talk?
    if(!self.active)
      return false
    end
  	self.weight == self.class.min_weight 
  end

  def as_json(options)
  	super( :methods => [:next_talk], :except => [:provider, :uid, :email] )
  end

end
