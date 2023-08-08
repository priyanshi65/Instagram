class User < ApplicationRecord 
  include Followable
  
    validates :image, presence: false
  
    devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
         
    has_many :posts, dependent: :destroy

    has_many :likes,dependent: :destroy

    has_many :comments,dependent: :destroy
    
    has_one_attached :image
    
    
  end
  
  
  
  
  
  
  
  
  

  

  

  



  
  
  
  
  # has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  # has_many :followees, through: :followed_users
  # has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  # has_many :followers, through: :following_users
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :likes
  # has_many :comments
  # validates :username, presence: true, uniqueness:{case_sensitive: false}      
  
        #  def change
        #   add_column :users, :followers_count, :integer, null: false, default: 0
        #   add_column :users, :followings_count, :integer, null: false, default: 0
        # end
        
        #  attr_writer :login
        #  def login
        #    @login || self.username|| self.email
        #  end
        
        #   def self.find_first_by_auth_conditions(warden_conditions)
        #     conditions = warden_conditions.dup
        #     if(login=conditions.delete(:login))
        #       where(conditions).where(["lower(username)=:value or lower(email)=:value",{:value=> login.downcase}]).first
        #     else
        #       if conditions[:username].nil?
        #         where(conditions).first
        #       else
        #         where(username: conditions[:username]).first
        #       end
        #     end
        #   end
        
        

        
        


        










