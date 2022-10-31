Given("an active translator service") do
  # Write code here that turns the phrase above into concrete actions
  # The silvio framework, can't activate a translator service!
  # It expects the the translator service is active prior starting silvio.
end

When("I send a valid URL message to the translator service") do
  create_person_type = FactoryGirl.build(:person_type, :create)
  initiating_message = FactoryGirl.build(:message, correspondent: create_person_type)
  @response_message = send_request(initiating_message)
end

Then("the translator service responds with an URL accept message") do
  expect(@response_message.correspondent.command).to eq_enumerator('Accept')
end
