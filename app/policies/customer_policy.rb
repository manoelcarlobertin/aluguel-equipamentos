class CustomerPolicy < ApplicationPolicy
  def index?
    # Defina aqui quem pode acessar a lista de clientes
    # Exemplo: só admins podem acessar
    user.admin?
  end

  # Você pode adicionar outros métodos para outras ações, ex:
  # def show?
  #   user.admin? || user == record.owner
  # end
end
