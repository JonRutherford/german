require 'spec_helper'

describe "sentences/index" do
  before(:each) do
    assign(:sentences, [
      stub_model(Sentence,
        :english => "English",
        :german => "German"
      ),
      stub_model(Sentence,
        :english => "English",
        :german => "German"
      )
    ])
  end

  it "renders a list of sentences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English".to_s, :count => 2
    assert_select "tr>td", :text => "German".to_s, :count => 2
  end
end
