require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Magpie::Feed" do

  it "produces correct json" do
    feed = Magpie::Feed.new
    property = feed.add_property(id: 'property1')
    property.name = "property 1"

    expect(feed.to_json(skip_validations: true)).to eq_json("{\"feed_provider\":null,\"publisher_email\":null,\"publisher_application\":null,\"publisher_application_version\":null,\"companies\":[],\"people\":[],\"properties\":[{\"locked_listing\":false,\"id\":\"property1\",\"for_lease\":true,\"name\":\"property 1\"}],\"units\":[]}")
  end

end
