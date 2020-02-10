require 'test_helper'
 
class MessageTemplateTest < ActiveSupport::TestCase
  test "Set variable values" do
    message = "Hi %{first_name}, Your ticket numbers are %{ticket_numbers}"
    values  = { first_name: "Aidan", ticket_numbers: "A1000" }

    message_template = MessageTemplate.new 
    message_template.set_variable_values(message, values)

    assert message = "Hi Aidan, Your ticket numbers are A1000", "Message is as expected"
  end
end
