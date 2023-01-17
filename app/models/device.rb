class Device < ApplicationRecord
  validates :unitname, presence: true
  validates :ipaddress, presence: true
  validates :sensore_type, presence: true
  validates :community, presence: true
  validates :oid, presence: true
  validates :alarm, presence: true
end
