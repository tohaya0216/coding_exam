class Recipe < ApplicationRecord
   has_many :recipe_processes, dependent: :destroy
   accepts_nested_attributes_for :recipe_processes

   has_many :materials, dependent: :destroy
   accepts_nested_attributes_for :materials

  has_many :recipe_tag
  has_many :tag, through: :recipe_tag

  # photoをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
