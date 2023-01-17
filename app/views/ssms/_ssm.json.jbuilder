json.extract! ssm, :id, :unitname, :ipaddress, :created_at, :updated_at
json.url ssm_url(ssm, format: :json)
