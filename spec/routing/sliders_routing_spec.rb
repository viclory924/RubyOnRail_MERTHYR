require "spec_helper"

describe SlidersController do
  describe "routing" do

    it "routes to #index" do
      get("/sliders").should route_to("sliders#index")
    end

    it "routes to #new" do
      get("/sliders/new").should route_to("sliders#new")
    end

    it "routes to #show" do
      get("/sliders/1").should route_to("sliders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sliders/1/edit").should route_to("sliders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sliders").should route_to("sliders#create")
    end

    it "routes to #update" do
      put("/sliders/1").should route_to("sliders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sliders/1").should route_to("sliders#destroy", :id => "1")
    end

  end
end
