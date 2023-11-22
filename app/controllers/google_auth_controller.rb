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
        require "googleauth/token_validator"

        client_id = "1024586643840-jqsukd4hk5e9gpiqdu7fqfkn0echtbt6.apps.googleusercontent.com"
        id_token = "ya29.a0AfB_byDauZQUha7q7nCnYcPrOCDtADt01ButgK11ZtP1xbBEFFE5-Hb2oGGDRAQ_bBmB80tA6Kyjb2uSky_UI93bM3OS5keMbyFSWS9Tun0O5GNxBvZ0XIRcpTXQd04OTpk-DTqydcBIjl6PUMKaJuqipaNXikOlZgaCgYKAZQSARISFQHGX2Mifjmr3gLSlJLEalL-dcFN0Q0169"

        begin
            valid = Google::Auth::TokenValidator.new(id_token, client_id).validate
        rescue Google::Auth::TokenValidator::Error => e
            puts e.message
            valid = false
        end

        puts "STATUS: #{valid}"
    end

end
