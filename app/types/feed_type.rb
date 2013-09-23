class FeedType < Feed
  include BaseType

  permit :title, :content, :state_event
end
