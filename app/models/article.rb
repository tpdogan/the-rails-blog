class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    list = []
    tags.each {|tag| list.push(tag.name)}
    list.join(", ")
  end
  def tag_list=(tags_string)
    list = tags_string.split(",")
    uniq_tag_array = list.map {|tag| tag.strip.downcase}.uniq

    new_or_found = uniq_tag_array.map {|tag| Tag.find_or_create_by(name: tag)}
    self.tags = new_or_found
  end
end
