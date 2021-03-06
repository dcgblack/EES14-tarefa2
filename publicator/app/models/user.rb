class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :publications, dependent: :destroy
  has_many :authors, dependent: :destroy

  scope :confirmed, -> { where.not(confirmed_at: nil) }

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  validates_format_of :email, with: EMAIL_REGEXP
  has_secure_password

  def self.authenticate(email, password)
      find_by(email: email).
      try(:authenticate, password)
  end
end
