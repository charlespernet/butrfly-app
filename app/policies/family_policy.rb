class FamilyPolicy < ApplicationPolicy
  def update?
    @user == record
  end

  # def show?
  #   @user.admin
  # end

  # def index?
  #   true
  # end

end
