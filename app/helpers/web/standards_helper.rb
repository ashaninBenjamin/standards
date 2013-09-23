module Web::StandardsHelper
  def standard_access_states
    Standard.state_machine(:access_state).states.map {|s| [s.human_name, s.name]}
  end

  def standard_states
    Standard.state_machine(:state).states.map {|s| [s.human_name, s.name]}
  end
end
