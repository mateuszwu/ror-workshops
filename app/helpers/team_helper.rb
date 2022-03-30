module TeamHelper
  def input_error(model, field_name)
    model.errors.full_messages_for(field_name).each do |message|
      message
    end
  end
end
