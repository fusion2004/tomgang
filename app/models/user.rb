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

  validates :name, presence: true, uniqueness: { :case_sensitive => false }

  before_create :init_level

  def init_level
    self.level = 1
    self.current_hp = 100
    self.max_hp = 100
    self.current_mana = 50
    self.max_mana = 50
    self.str = 5
    self.vit = 5
    self.dex = 5
    self.int = 5

    true
  end

  def init_leveling!
    self.last_level_up = Time.now
    save

    calc_next_level_up!
  end

  def check_level
    if self.next_level_up == nil
      init_leveling!
    elsif self.next_level_up <= Time.now
      level_up!
    end
  end

  def level_up!
    self.level = self.level + 1
    self.last_level_up = Time.now

    self.max_hp = calc_max_hp
    self.current_hp = self.max_hp

    self.max_mana = calc_max_mana
    self.current_mana = self.max_mana

    save

    calc_next_level_up!
  end

  def calc_next_level_up!
    next_level = self.level + 1
    secs = Math.log(next_level ** next_level, Math::E) + next_level ** 2

    self.next_level_up = self.last_level_up + secs.seconds
    save
  end

  def calc_max_hp
    (90.0 + 6.0 * Math.log(self.vit ** self.level, Math::E)).ceil
  end
  def calc_max_mana
    (45.0 + 3.0 * Math.log(self.int ** self.level, Math::E)).ceil
  end
end
