class AupairPolicy < ApplicationPolicy
  def update?
    @user == record
  end
end
