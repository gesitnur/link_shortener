class Link < ApplicationRecord
  before_validation :generate_short_code, on: :create

  validates :original_url, presence: true, format: URI::regexp(%w[http https])
  validates :short_code, presence: true, uniqueness: true,
                         format: { with: /\A[a-zA-Z0-9_-]+\z/,
                                   message: "hanya boleh huruf, angka, - atau _" }

  private

  def generate_short_code
    if short_code.blank?
      self.short_code = SecureRandom.alphanumeric(6)
    end
  end
end
