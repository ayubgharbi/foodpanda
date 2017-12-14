Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'910179495815601', 'b3184c4c7eeef35f5e3dcd232cebaef6', scope: 'email', info_fields: 'email, name'
end
