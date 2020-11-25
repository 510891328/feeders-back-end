class UserCategoriesController < ApplicationController
  skip_before_action :authorized, only:[:destroy, :user_categories]
  def create
    token = JWT.decode(params[:token], ENV['AUTH_SECRET'], 'HS256')

    user = User.find(token[0]['user_id'])

    category = Category.find_by!(name: params[:name])

    if user.categories.include?(category)
      render json: {message: 'Category Existed'}
    else
      user_category = UserCategory.create(user:user, category: category)
      render json: UserCategorySerializer.new(user_category).to_json
    end
  end

  def user_categories
    user = User.find(params[:user_id])
    user_categories = user.user_categories.map do |user_category|
      UserCategorySerializer.new(user_category)
    end
    render json: user_categories.to_json
  end

  def destroy
    user_category = UserCategory.find(params[:id])

    render json: user_category.to_json

    user_category.destroy
  end
end
