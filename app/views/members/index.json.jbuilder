json.array!(@members) do |member|
  json.extract! member, :id, :email, :senha, :nome, :login, :data_criacao, :email_admin
  json.url member_url(member, format: :json)
end
