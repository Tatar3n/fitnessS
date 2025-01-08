class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  # validates :password_digest, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
  has_secure_password
  def age
    return nil if birthday.nil?
    birthday_date = birthday.to_date
    # Получаем текущую дату
    today = Date.today
    # Вычисляем возраст
    age = today.year - birthday_date.year
    age -= 1 if today < birthday_date.change(year: today.year) # Уменьшаем на 1, если день рождения еще не был в этом году
    age
  end
end
