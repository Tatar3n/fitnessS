class User < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :competitions_users
  has_many :competitions, through: :competitions_users
  has_many :results_as_referee, class_name: "User", foreign_key: :referee_id
  has_many :results_as_athlete, class_name: "User", foreign_key: :athlete_id

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
  def competitions_as_athlete
    competitions_users.select { |cu| cu.role == 1 }.map(&:competition)
    # competitions.joins(:competitions_users).where(competitions_users: { role: 1 })
  end
  def competitions_as_referee
    competitions_users.select { |cu| cu.role == 2 }.map(&:competition)
    # competitions.where(id: competitions_users.where(role: 2).pluck(:competition_id))
  end

  def referee?
    roles.find_by_role_name(:referee).present?
  end
  def athlete?
    roles.find_by_role_name(:athlete).present?
  end
end