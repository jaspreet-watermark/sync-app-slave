class Item
  include Mongoid::Document
  include Mongoid::Enum
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  # Fields
  field :title,        type: String
  field :description,  type: String
  field :status,       type: String
end

