class Study < ActiveRecord::Base
  belongs_to :user
  serialize :instructions, Array
end
