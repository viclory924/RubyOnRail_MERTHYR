require "spec_helper"

describe PageTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/page_templates").should route_to("page_templates#index")
    end

    it "routes to #new" do
      get("/page_templates/new").should route_to("page_templates#new")
    end

    it "routes to #show" do
      get("/page_templates/1").should route_to("page_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/page_templates/1/edit").should route_to("page_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/page_templates").should route_to("page_templates#create")
    end

    it "routes to #update" do
      put("/page_templates/1").should route_to("page_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/page_templates/1").should route_to("page_templates#destroy", :id => "1")
    end

  end
end
