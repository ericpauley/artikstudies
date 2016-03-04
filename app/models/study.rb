class Study < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :instructions
  accepts_nested_attributes_for :instructions, reject_if: :all_blank

  def is_active
    self.end != nil and Time.now < self.end and self.start != nil and Time.now > self.start
  end

  def percent_done
    ((Time.now-self.start)/(self.end-self.start)*100).round
  end
end

class Instruction < ActiveRecord::Base
  belongs_to :Study
end
