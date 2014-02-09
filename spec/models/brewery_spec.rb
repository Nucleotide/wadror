require 'spec_helper'

require 'spec_helper'

describe Brewery do
  it "has the name and year set correctly and is saved to database" do
    brewery = Brewery.create name:"Schlenkerla", year:1674

    brewery.name.should == "Schlenkerla"
    brewery.year.should == 1674
    brewery.should be_valid
  end

  it "without a name is not valid" do
    brewery = Brewery.create  year:1674

    brewery.should_not be_valid
  end
end
