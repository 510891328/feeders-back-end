class UserCategorySerializer < ActiveModel::Serializer
  attributes :id, :category, :user
  belongs_to :category
  belongs_to :user
  def category
    self.object.category.name
  end

  def user
    self.object.user.name
  end

end
