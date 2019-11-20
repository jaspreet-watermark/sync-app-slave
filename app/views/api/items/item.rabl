object @item
attributes :id,
           :master_id,
           :title,
           :status,
           :description,
           :created_at,
           :updated_at

node(:id) { |o| o.id.to_s }
node(:created_at) { |o| o.created_at.strftime("%B %d, %Y %I:%M %p") }
node(:updated_at) { |o| o.updated_at.strftime("%B %d, %Y %I:%M %p") }