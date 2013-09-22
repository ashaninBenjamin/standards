class StandardType < Standard
  include BaseType

  permit :name, :number, :content, :state, :access_state, :access_state_event, :parent_id

end
