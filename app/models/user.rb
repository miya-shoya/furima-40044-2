class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :buys
         has_many :items
 

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_ZENKAKU = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  PASSWORD_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze

    validates :nickname, presence: true
    validates :password, format: { with: PASSWORD_REGEX }
    validates :firstname, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :lastname, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :firstname_kana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :lastname_kana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :birthday,presence: true
  end

