class Meal < ApplicationRecord

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id', validate: true
  has_and_belongs_to_many :participants, class_name: 'User'

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :address, :title, :description, :max_people, :date, :place, presence: true

end
