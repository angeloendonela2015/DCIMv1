class Noc < ApplicationRecord
  validates :sensorename, presence: true
  validates :oid, presence: true
  validates :ipname, presence: true
  validates :ipaddress, presence: true
end
