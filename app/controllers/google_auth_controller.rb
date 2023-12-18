class GoogleAuthController < ApplicationController
    # def validate_access_token
    #     token = request.headers['Authorization']&.gsub(/bearer /i, '')
    #     puts "TOKEN", token
    #     # key_source = Google::Auth::IDTokens::JwkHttpKeySource.new(Google::Auth::IDTokens::OAUTH2_V3_CERTS_URL)
    #     key_source = Google::Auth::IDTokens::JwkHttpKeySource.new('https://www.googleapis.com/oauth2/v3/certs')
    #     verifier = Google::Auth::IDTokens::Verifier.new(key_source: key_source)
    #     verifier.verify(token)
    #     puts "VERIFIED"
    # rescue Google::Auth::IDTokens::VerificationError => e
    #     puts "FAILED"
    #     puts "Error: #{e.message}"
    # rescue StandardError => e
    #     puts "FAILED"
    #     puts "Error: #{e.message}"
    # end

    # def validate_access_token
    #     # Set your Google client ID and client secret
    #     client_id = ENV['GOOGLE_CLIENT_ID']
    #     client_secret = ENV['GOOGLE_CLIENT_SECRET']

    #     # Create a Google OAuth client
    #     auth = Google::Auth::Client.new(
    #       client_id: client_id,
    #       client_secret: client_secret,
    #       scope: Google::Apis::Oauth2V2::AUTH_USERINFO
    #     )

    #     # Get the access token from the request or session
    #     access_token = request.headers['Authorization']&.gsub(/bearer /i, '')
    #     puts "TOKEN: #{access_token}"

    #     # Verify the token using the auth client
    #     token = auth.get_access_token(access_token: access_token)

    #     puts token.valid?
    # end



    # Пропустіть перевірку CSRF-токена, якщо ви використовуєте API
  skip_before_action :verify_authenticity_token

  # Додайте before_action, який буде перевіряти токен Google OAuth2
  before_action :verify_google_token

  def hello
      render "Hello"
  end

  # Створіть приватний метод, який буде перевіряти токен Google OAuth2
  private

  def verify_google_token
    # Отримайте токен з заголовка Authorization
    token = request.headers["Authorization"]

    # token = "ya29.a0AfB_byA6V9vv6w72i1gsHXwXBI-gLaSUdtzdlnnIoU6vL1hkS-KGtUeBEMXwue0KQbojBAS5jM4OBu64iDLNda_smMtvnGcjBsEFoOB6s8KmrDNB66h1aplJ2pNAUru-zxz5KEefXbc0OBuABViyAljPcPm1k3C2KegaCgYKAZ0SARISFQHGX2Mi_FL_GDv4OtyV-Mw5ahbVqw0170"

    # Перевірте токен за допомогою класу GoogleAuth
    user_data = GoogleAuth.verify(token)

    # Якщо токен дійсний, збережіть дані користувача в змінній @current_user
    # Ви можете використовувати цю змінну в інших контролерах API
    if user_data
      @current_user = user_data
    else
      # Якщо токен недійсний, відправте відповідь з кодом 401 (Unauthorized) і повідомленням про помилку
      render json: { error: "Invalid Google OAuth2 token" }, status: :unauthorized
    end
  end
end
