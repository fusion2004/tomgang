class User < ActiveRecord::Base
  include FriendlyId
  include Gravtastic

  friendly_id :name, :use => :slugged
  has_gravatar
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :last_level_up, :level, :name, :next_level_up, :slug
end
