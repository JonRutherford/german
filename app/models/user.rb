# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  email                  :string(255)
#  user_name              :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  admin                  :boolean          default(FALSE)
#  remember_token         :string(255)
#  password_digest        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :user_name, :email, :password, :password_confirmation
  has_secure_password

  validates :name,  presence: true, length: { maximum: 50 }
  validates :user_name,  presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }, 
                                                                  format: { with: /\A[A-Za-z\d_]+\z/i }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :password_changed?
  validates :password_confirmation, presence: true, if: :password_changed?    
  
  before_save { email.downcase! }
  before_save { generate_token(:remember_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    #UserMailer.password_reset(self).deliver
  end
  
  def password_changed?
      !@password.blank?
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end                                                           
end
