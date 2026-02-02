class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Relaciones
  has_many :tickets, dependent: :destroy
  has_many :assigned_tickets, class_name: 'Ticket', foreign_key: 'assignee_id'
  has_many :comments, dependent: :destroy

  # Roles: Usamos customer como el nivel base
  enum :role, { customer: 0, agent: 1, admin: 2 }, default: :customer

  # Asegurar que siempre haya un rol al crear en memoria
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :customer
  end
end