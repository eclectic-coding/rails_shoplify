class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    email
  end

  after_create do
    create_stripe_id
  end

  private

  def create_stripe_id
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
  end
end
