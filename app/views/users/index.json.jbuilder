json.user do
  json.array! @users do |user|
    json.username user.username
  end
end