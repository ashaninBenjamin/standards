class UniqueNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    if value.present?
      if value.nonzero?
        if record.siblings.where('id != ?', record.id).where(number: value).any?
          record.errors.add(attr, :taken)
        end
      else
        if record.siblings.where('id != ?', record.id).where(user_id: record.user_id).any?
          record.errors.add(attr, :taken)
        end
      end
    end
  end
end
