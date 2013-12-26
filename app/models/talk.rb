class Talk
  include Mongoid::Document
  field :topic, type: String
  field :date, type: Date
  belongs_to :user
end
