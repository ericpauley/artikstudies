class Study < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :instructions
  accepts_nested_attributes_for :instructions, reject_if: :all_blank

  def is_active
    self.end != nil and Time.now < self.end
  end
end

class Instruction < ActiveRecord::Base
  belongs_to :Study
end
