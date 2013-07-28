require 'spec_helper'

describe "sentences/new" do
  before(:each) do
    assign(:sentence, stub_model(Sentence,
      :english => "MyString",
      :german => "MyString"
    ).as_new_record)
  end

  it "renders new sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sentences_path, "post" do
      assert_select "input#sentence_english[name=?]", "sentence[english]"
      assert_select "input#sentence_german[name=?]", "sentence[german]"
    end
  end
end
