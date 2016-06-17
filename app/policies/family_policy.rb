class FamilyPolicy < ApplicationPolicy
  def update?
    @user == record
  end
end
