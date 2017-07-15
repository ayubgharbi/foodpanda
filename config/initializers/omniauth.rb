Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'1097098260424468', '184d2af8942ef541ea4164bf847e3a20', scope: 'email', info_fields: 'email, name'
end
