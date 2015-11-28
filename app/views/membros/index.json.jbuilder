json.array!(@membros) do |membro|
  json.extract! membro, :id, :email, :senha, :nome, :login, :data_criacao, :email_admin
  json.url membro_url(membro, format: :json)
end
