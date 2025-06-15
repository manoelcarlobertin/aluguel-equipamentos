class CustomerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all  # Admin vê todos os clientes
      else
        scope.none
        # scope.where(user_id: user.id)  # Usuário comum vê só seus clientes (ajuste conforme seu modelo)
      end
    end
  end

  def index?
    user.present?  # Qualquer usuário logado pode acessar a lista (ajuste se quiser só admin)
  end

  def show?
    user.admin? || record.user_id == user.id
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? || record.user_id == user.id
  end

  def destroy?
    user.admin?
  end
end
