# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :admin, :record

  def initialize(admin, record)
    @admin = admin
    @record = record
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    admin.present?
  end

  def edit?
    update?
  end

  def destroy?
    admin.present?
  end

  class Scope
    def initialize(admin, scope)
      @admin = admin
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :admin, :scope
  end
end
