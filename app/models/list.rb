class List < ApplicationRecord
  has_one_attached :image #Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記された

  validates :title, presence: true #「必須入力」の設定
  validates :body, presence: true #「必須入力」の設定
  validates :image, presence: true #「必須入力」の設定
end
