class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # is_deletedがfalseならtrueを返すようにしている
  
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
  
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  

  
has_one_attached :profile_image

# is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end



def get_profile_image(width, height)
  (profile_image.attached?) ? profile_image : 'no_image.jpg'
end


  
end
