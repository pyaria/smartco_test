class Scientist < ActiveRecord::Base
  has_many :grantings, dependent: :nullify
  has_many :granted_grants, through: :grantings, source: :grants
end
