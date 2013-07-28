require 'spec_helper'

describe "sentences/edit" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :english => "MyString",
      :german => "MyString"
    ))
  end

  it "renders the edit sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sentence_path(@sentence), "post" do
      assert_select "input#sentence_english[name=?]", "sentence[english]"
      assert_select "input#sentence_german[name=?]", "sentence[german]"
    end
  end
end
