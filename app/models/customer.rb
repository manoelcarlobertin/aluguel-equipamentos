# def self.ransackable_attributes(auth_object = nil)
#   [ "name" ]
# end
class Customer < ApplicationRecord
  # Scopes for ordering and searching
  scope :ordered, -> { order(:name) }
  scope :search_by_name, ->(term) {
    q = sanitize_sql_like(term.downcase)
    where("LOWER(name) LIKE ?", "%\#{q}%")
  }

  # Basic validations
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :mobile_phone, allow_blank: true, format: { with: /\A\+?[0-9]{8,15}\z/, message: "is invalid" }
  # ... other model-level rules
end
