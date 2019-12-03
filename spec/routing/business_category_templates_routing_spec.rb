require "spec_helper"

describe BusinessCategoryTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/business_category_templates").should route_to("business_category_templates#index")
    end

    it "routes to #new" do
      get("/business_category_templates/new").should route_to("business_category_templates#new")
    end

    it "routes to #show" do
      get("/business_category_templates/1").should route_to("business_category_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_category_templates/1/edit").should route_to("business_category_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_category_templates").should route_to("business_category_templates#create")
    end

    it "routes to #update" do
      put("/business_category_templates/1").should route_to("business_category_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_category_templates/1").should route_to("business_category_templates#destroy", :id => "1")
    end

  end
end
