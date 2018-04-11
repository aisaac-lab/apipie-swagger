Apipie.configure do |config|
  config.app_name = 'API Document'
  config.api_base_url['public'] = ''
  config.doc_base_url = '/apipie'
  config.default_locale = 'ja'

  config.api_controllers_matcher = "#{Rails.root}/app/controllers/{[!concerns/]**/*,*}.rb"
  config.default_version = 'public'

  config.languages = %w[en ja]


end
