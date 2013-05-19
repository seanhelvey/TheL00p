class Membership < ActiveRecord::Base
  attr_accessible :member_id, :member_of_id

  belongs_to :member, class_name: "User"
  belongs_to :member_of, class_name: "Micropost"

end
