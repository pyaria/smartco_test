class Grant < ActiveRecord::Base
  has_many :grantings, dependent: :nullify
  has_many :granted_scientists, through: :grantings, source: :scientists
end
