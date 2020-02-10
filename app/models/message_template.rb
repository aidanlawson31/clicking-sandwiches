class MessageTemplate
  def set_variable_values(message, values)
    values.default_proc = proc { |h, k| "%{#{k}}" }

    message % values
  end
end
