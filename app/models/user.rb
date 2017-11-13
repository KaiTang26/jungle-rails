class User < ActiveRecord::Base

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email,
               presence: true,
               uniqueness: { case_sensitive: false }
               
    validates :password, length: {minimum: 8}
               
    def self.authenticate_with_credentials(email, password)
        @em = email.strip
        @user = User.find_by_email(@em)
        if @user && @user.authenticate(password)
            true
        end
    end
end
