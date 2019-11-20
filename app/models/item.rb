class Item
  include Mongoid::Document
  include Mongoid::Enum
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  # Fields
  field :master_id,    type: String
  field :title,        type: String
  field :description,  type: String
  field :status,       type: String
end

