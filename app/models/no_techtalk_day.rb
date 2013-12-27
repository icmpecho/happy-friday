class NoTechtalkDay
  include Mongoid::Document
  field :date, type: Date
  field :reason, type: String
  belongs_to :reporter, class_name: 'User' 
end
