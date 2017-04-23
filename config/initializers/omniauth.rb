Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['116679698883414'], ENV['1f84fe30601855db7378b52f1baa7923']
end
