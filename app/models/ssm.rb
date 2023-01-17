class Ssm < ApplicationRecord
  validates :unitname, presence: true
  validates :ipaddress, presence: true
end
