class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :expense, numericality: true
  validates :time, numericality: true

  has_many :recipe_processes, dependent: :destroy
  accepts_nested_attributes_for :recipe_processes

  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  # photoをattachファイルとする。stylesで画像サイズを定義できる
  #has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  has_attached_file :photo,
                  :storage => :s3,
                  :s3_permissions => :"public-read",
                  :path => ":attachment/:id/:style.:extension"

  validates_attachment :photo, content_type: { content_type: ["movie/mp4","video/mp4","image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
