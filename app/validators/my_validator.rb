class MyValidator < ActiveModel::Validator
  def validate(record)
    number = record.body.split(/\s+/).length
    record.errors.add(:body, 'oops') if number < 2
  end
end
