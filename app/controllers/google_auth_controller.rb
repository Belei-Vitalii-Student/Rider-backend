class GoogleAuthController < ApplicationController

  before_action :validate_access_token

  def validate_access_token
        token = request.headers['Authorization']&.gsub(/bearer /i, '')
        puts "TOKEN", token
        # key_source = Google::Auth::IDTokens::JwkHttpKeySource.new(Google::Auth::IDTokens::OAUTH2_V3_CERTS_URL)
        key_source = Google::Auth::IDTokens::JwkHttpKeySource.new('https://www.googleapis.com/oauth2/v3/certs')
        verifier = Google::Auth::IDTokens::Verifier.new(key_source: key_source)
        payload = verifier.verify(token)
        puts "PAYLOAD", payload
        user = User.where(email: payload['email']).first_or_initialize
        if user.new_record?
          user.name = payload['name']
          user.username = payload['email'].split('@').first
          user.picture = payload['picture']
          user.save!
          puts "NEW USER"
        end
        payload['user_id'] = user._id
        puts "VERIFIED"
        # @token = JWT.decode(token, nil, false)
        render json: {success: true, token: payload}, status: :ok
    rescue Google::Auth::IDTokens::VerificationError => e
        puts "FAILED 1"
        puts "Error: #{e.message}"
        render json: {success: false, error: e.message}, status: :unauthorized
    rescue StandardError => e
        puts "FAILED 2"
        puts "Error: #{e.message}"
        render json: {success: false, error: e.message}, status: :unauthorized
  end
end
