require 'rails_helper'

describe SnippetsController do
  let(:snippet) {FactoryGirl.create(:snippet)}

  #describe "GET #index" do
    #it "returns http success" do
      #get :index
      #expect(response).to have_http_status(:success)
    #end
  #end

  it "shows stuff" do
    get :show, id: snippet
    expect(response).to have_http_status(:success)
  end
end
