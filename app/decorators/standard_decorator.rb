class StandardDecorator < Draper::Decorator
  delegate_all

  decorates_association :parent
  decorates_association :children
  decorates_association :descendants

  def for_select
    if number.zero?
      h.t(".select_include_blank")
    else
      ("-" * (depth - 1)) + "#{code} #{name}"
    end
  end

  def code_with_name
    "#{code}. #{name}"
  end

  def corrected_content
    result = content
    configus.tags.to_hash.each_pair do |key, value|
      replacement = h.current_client.send(key)
      result = result.gsub(value, replacement) if replacement.present?
    end
    result
  end
end
