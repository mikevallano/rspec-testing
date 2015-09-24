class StorePolicy < ApplicationPolicy

  def index?
    true
    # user.admin? || user.account_owner? || user.manager? || user.counselor?
  end

  def show?
    scope.where(:id => record.id).exists?
    # user.projects.include?(record.project) #this refused to fucking work
  end

  def create?
    user.admin? #|| user.account_owner? || user.manager?
  end

  def new?
    create?
  end

  def update?
    user.admin? #|| user.account_owner? || user.manager? #|| record_owner?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

end