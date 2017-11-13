Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'269545396900966', 'f87c766b78f4e1f27406c6b41be601e9', scope: 'email', info_fields: 'email, name'
end
