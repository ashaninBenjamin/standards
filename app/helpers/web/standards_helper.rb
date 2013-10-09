module Web::StandardsHelper
  def standard_access_events
    Standard.state_machine(:access_state).events.map {|s| [s.human_name, s.name]}
  end

  def standard_events
    Standard.state_machine(:state).events.map {|s| [s.human_name, s.name]}
  end
end
