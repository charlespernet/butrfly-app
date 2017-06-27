class AupairPolicy < ApplicationPolicy
  def update?
    @user == record
  end

  def show?
    @user.admin
  end

end
