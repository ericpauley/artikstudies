class Study < ActiveRecord::Base
  belongs_to :user
  serialize :instructions, Array

  def is_active
    self.end != nil and Time.now < self.end
  end
end
