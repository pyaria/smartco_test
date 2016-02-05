class Granting < ActiveRecord::Base
  belongs_to :grant
  belongs_to :scientist
end
