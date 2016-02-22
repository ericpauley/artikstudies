class Probe < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :user
  has_many :probe_datapoints, dependent: :destroy
end

class ProbeDatapoint < ActiveRecord::Base
  belongs_to :probe
end
