class StandardNewType < Standard
  include BaseType

  permit :name, :number, :content, :state, :access_state, :access_state_event, :parent_id

  def available_numbers(user)
    user.standards.roots.first.node_numbers
  end

  def available_parents(user)
    user.standards
  end
end
