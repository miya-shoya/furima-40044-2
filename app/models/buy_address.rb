class BuyAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :token, :postal_code, :region_id, :city, :house_number, :building_number, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :region_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, 
      region_id: region_id, 
      city: city, 
      house_number: house_number, 
      phone_number: phone_number, 
      building_number: building_number, 
      buy_id: buy.id
    )
  end
end
