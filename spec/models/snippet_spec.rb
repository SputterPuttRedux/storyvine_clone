require 'rails_helper'
require 'factory_girl_rails'

describe Snippet do

  let(:snippet) { FactoryGirl.create(:snippet, content: "Razmatazz") }

  it "has a valid FACTORY" do
    expect(FactoryGirl.create(:snippet)).to be_valid
  end

  it "to be valid Snippet" do
    expect(snippet).to be_valid
  end

  it "should have content" do
    expect(snippet.content).to eq(snippet.content)
  end

end
