class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
 

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_ZENKAKU = /\A[ぁ-んァ-ン一-龥々ヶヴァ]+\z/.freeze
  PASSWORD_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
  validates :password, format: { with: /\A[\p{ascii}&&[^ ]]+\z/, message: 'は半角英数字で入力してください' }

    validates :password, format: { with: PASSWORD_REGEX }
    validates :firstname, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :lastname, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :firstname_kana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :lastname_kana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :birthday
  end
end

