OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '132212844070239', 'f861a92f83fb52c60df47a67a11c2276', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end