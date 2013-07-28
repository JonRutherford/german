require 'spec_helper'

describe "sentences/show" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :english => "English",
      :german => "German"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English/)
    rendered.should match(/German/)
  end
end
