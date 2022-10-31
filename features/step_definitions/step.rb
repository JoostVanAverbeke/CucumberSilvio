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

When("I send a person URL message with an identification {string} assigned by {string}, to the translator service") do |string, string2|
  create_person_type = FactoryGirl.build(:person_type, :create)
  create_person_type.identificationList  = IdentificationListTypeBuilder.new.
          add(FactoryGirl.build(:mipsn_identifications,
                                source: FactoryGirl.build(:correspondent_type, internalId: string2),
                                code: string)).build

  initiating_message = FactoryGirl.build(:message, correspondent: create_person_type)
  @response_message = send_request(initiating_message)
end

When("I send a person URL message with the following identifications to the translator service") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  create_person_type = FactoryGirl.build(:person_type, :create)
  builder = IdentificationListTypeBuilder.new
  # table.hashes
  # Converts the table to an array of hashes, where the keys are the table headers from the first row
  #
  table.hashes.each do |hash|
    builder.add(FactoryGirl.build(:mipsn_identifications,
                                source: FactoryGirl.build(:correspondent_type, internalId: hash[:assigned_by]),
                                code: hash[:code]))
  end
  create_person_type.identificationList = builder.build
  initiating_message = FactoryGirl.build(:message, correspondent: create_person_type)
  @response_message = send_request(initiating_message)
end

Then("the translator service responds with an URL accept message") do
  expect(@response_message.correspondent.command).to eq_enumerator('Accept')
end
