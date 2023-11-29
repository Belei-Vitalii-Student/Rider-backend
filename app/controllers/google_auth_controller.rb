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

    def validate_access_token


        # Set your Google client ID and client secret
        client_id = ENV['GOOGLE_CLIENT_ID']
        client_secret = ENV['GOOGLE_CLIENT_SECRET']

        # Create a Google OAuth client
        auth = Google::Auth::Client.new(
          client_id: client_id,
          client_secret: client_secret,
          scope: Google::Apis::Oauth2V2::AUTH_USERINFO
        )

        # Get the access token from the request or session
        access_token = request.headers['Authorization']&.gsub(/bearer /i, '')
        puts "TOKEN: #{access_token}"

        # Verify the token using the auth client
        token = auth.get_access_token(access_token: access_token)

        puts token.valid?
    end

end
