class UserCategorySerializer < ActiveModel::Serializer
  attributes :id, :category, :user, :category_type
  belongs_to :category
  belongs_to :user
  def category
    self.object.category.name
  end

  def category_type
    self.object.category.category_type
  end

  def user
    self.object.user.name
  end

end
