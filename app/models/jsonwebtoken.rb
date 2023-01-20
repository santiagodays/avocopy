class JsonWebToken
  def encode(payload)
    expiration = 30.minutes.from_now.to_i
    JWT.encode payload.merge(exp: expiration), Rails.application.secrets.secret_key_base
  end

  def decode(token)
    JWT.encode token, Rails.application.secrets.secret_key_base
  end
end