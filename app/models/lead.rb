# Lead model logic
class Lead < ApplicationRecord
  # format the phone number before saving
  before_save :format_phone_number
  # validate the presence of the fields
  validates :first_name, :last_name, :email, :phone, :city, :state, presence: true

  private

  # Reformat phone number to (123) 456-7890 from whatever the user entered
  def format_phone_number
    self.phone = self.phone.gsub(/\D/, '').insert(0, '(').insert(4, ') ').insert(9, '-')
  end
end
