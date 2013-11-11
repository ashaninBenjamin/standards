module ApplicationHelper
  def ham(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def object_state_label(object)
    lbl = case object.state
            when 'published', 'active'
              'label-success'
            when 'unpublished', 'new', 'inactive', 'refrained'
              'label-info'
            when 'archived'
              'label-warning'
            when 'deleted'
              'label-important'
          end
    content_tag(:span, object.human_state_name, {class: "label #{lbl}"})
  end

  def tags
    configus.tags.to_hash.values
  end
end
