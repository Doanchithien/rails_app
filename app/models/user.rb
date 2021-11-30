require 'bcrypt'
class User < ApplicationRecord
    after_save  :check_user
    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :password, presence: true, confirmation: { case_sensitive: true }, length: { minimum: 6}
    validates :phone, presence: true, uniqueness: true, format: { with: /\A\d{9}\z/}
    
    def check_user
        pass_hash = BCrypt::Password.create(password)
        update_columns(password: pass_hash, password_confirmation: pass_hash)
    end
end
