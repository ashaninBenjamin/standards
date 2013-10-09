class StandardEditType < Standard
  include BaseType

  permit :name, :number, :content, :state, :state_event, :access_state, :access_state_event, :parent_id

  def available_numbers
    numbers = parent.node_numbers
    numbers << number
    numbers.sort
  end

  def available_parents(user)
    user.standards.exclude(subtree)
  end
end
