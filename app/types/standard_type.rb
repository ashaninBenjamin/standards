class StandardType < Standard
  include BaseType

  permit :name, :number, :content, :state, :state_event, :access_state, :access_state_event, :parent_id

end
