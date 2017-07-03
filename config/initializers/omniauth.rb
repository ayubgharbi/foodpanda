Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'116679698883414', '1f84fe30601855db7378b52f1baa7923', scope: 'email', info_fields: 'email, name'
end
