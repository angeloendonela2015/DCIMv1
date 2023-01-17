json.extract! device, :id, :unitname, :ipaddress, :sensore_type, :community, :oid, :alarm, :created_at, :updated_at
json.url device_url(device, format: :json)
