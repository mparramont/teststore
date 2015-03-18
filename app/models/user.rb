class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email, :address, :city, :postal_code
  has_many :orders
  has_many :order_items

  def full_address
  <<EOF
#{address}
#{postal_code} #{city}
#{country}
EOF
  end
end