Apipie.configure do |config|
  config.app_name = 'freee API'
  config.api_base_url['1.0'] = 'https://api.freee.co.jp'
  config.doc_base_url = '/apipie'
  config.default_locale = 'ja'

  config.markup = Apipie::Markup::Markdown.new
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/{[!concerns/]**/*,*}.rb"
  config.default_version = '1.0'
  config.languages = %w[ja]

  config.app_info['1.0'] = <<-EOS
    ## はじめに  

    1. freeeにサインアップします。
    1. アプリケーション一覧から「新しいアプリケーションを登録」します。
    1. アプリケーションの登録が完了すると、AppIDとSecretが取得できます。
    1. ローカルの開発環境でテストする際は、認証用URLを直接リクエストしてAuthorization Codeを取得できます。  
  
    アプリケーションの登録方法や認証方法、またはAPIの活用方法でご不明な点がある場合はヘルプセンターもご確認ください  

    ---

    ## 仕様
    ### APIエンドポイント
    ### 認証
    ### エンドポイント
    ### リフレッシュ
    ### 破棄
    ### データフォーマット
    ### 共通エラーレスポンス

    ---

    ## 連絡先
    ご不明点、ご要望等は freee サポートデスクへのお問い合わせフォーム からご連絡ください。
  EOS

end
