module Web::StandardsHelper
  def standard_events
    Standard.state_machine(:state).events.map {|s| [s.human_name, s.name]}
  end

  def standard_event_name(event)
    Standard.state_machine(:state).events.detect { |s| event.eql? s.name }.human_name
  end
end
