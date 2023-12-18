# Створіть файл config/initializers/google_auth.rb з таким вмістом
require 'googleauth'
require 'googleauth/id_tokens'

# Вкажіть шлях до вашого файлу ключа Google
GOOGLE_KEY_FILE = "app/assets/config/google_oauth2.json"

# Створіть клас GoogleAuth, який буде використовувати гем googleauth для перевірки токена
class GoogleAuth
  # Створіть метод класу, який буде повертати об'єкт Google::Auth::IDTokens::Validator
  def self.validator
    @validator ||= Google::Auth::IDTokens::Validator.new(
      aud: ENV["GOOGLE_CLIENT_ID"], # Вкажіть ваш Google Client ID
      key_source: Google::Auth::IDTokens::KeySource.new(GOOGLE_KEY_FILE) # Використовуйте ваш файл ключа Google
    )
  end

  # Створіть метод класу, який буде перевіряти токен і повертати хеш з даними користувача або nil, якщо токен недійсний
  def self.verify(token)
    begin
      # Використовуйте метод check або verify_oidc, щоб перевірити токен
      # Ці методи повертають хеш з даними користувача, такими як email, name, picture тощо
      # Ви можете використовувати ці дані для створення або оновлення користувача в вашій базі даних
      validator.check(token)
    rescue Google::Auth::IDToken::ValidationError => e
      # Якщо токен недійсний, методи check або verify_oidc викидають виняток
      # Ви можете логувати або обробляти цей виняток за вашим бажанням
      puts e.message
      Rails.logger.error(e.message)
      nil
    end
  end
end
