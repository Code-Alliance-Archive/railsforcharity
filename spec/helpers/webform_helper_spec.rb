require 'spec_helper'
include WebformHelper

describe "Webform Submission Helper" do

  before(:each) do
    @webformSubmissionHelper = WebformSubmissionHelper.new
  end

  after(:all) do
    WebformSubmittedData.delete_all
  end

  describe "create_volunteer_from_submission" do
    before(:each) do
      FactoryGirl.create(:ws_first_name, sid: 1, data: "FirstName_1")
      FactoryGirl.create(:ws_last_name, sid: 1, data: "LastName_1")
      FactoryGirl.create(:ws_email, sid: 1, data: "Person_1@example.com")
    end

    it "create volunteer with first name, last name and email" do
      @webformSubmissionHelper.create_volunteer_from_submission(1)

      Volunteer.count.should == 1

      volunteer = Volunteer.where(:id => 1).first

      volunteer.should_not be_nil
      volunteer.name.should == "FirstName_1 LastName_1"
      volunteer.email.should == "person_1@example.com"
      volunteer.id.should == 1
    end
  end

  describe "refresh_volunteers" do
    before(:all) do
      5.times { FactoryGirl.create(:ws_first_name)}
      5.times { FactoryGirl.create(:ws_last_name)}
      5.times { FactoryGirl.create(:ws_email)}
    end

    it "should update volunteer table with all volunteers from webform_submitted_data table" do

      WebformSubmittedData.count.should == 15
      @webformSubmissionHelper.refresh_volunteers

      Volunteer.count.should == 5

      volunteer_first = Volunteer.first
      volunteer_last = Volunteer.last

      volunteer_first.name.should == "FirstName_" + volunteer_first.id.to_s + " LastName_" + volunteer_first.id.to_s
      volunteer_last.name.should == "FirstName_" + volunteer_last.id.to_s + " LastName_" + volunteer_last.id.to_s
      volunteer_first.email.should == "person_" + volunteer_first.id.to_s + "@example.com"
      volunteer_last.email.should == "person_" + volunteer_last.id.to_s + "@example.com"

    end

    it "should handle missing sids" do
      WebformSubmittedData.create(:nid => 5, :sid => 51, :cid => 1, :no => 0, :data => "FirstName_51")
      WebformSubmittedData.create(:nid => 5, :sid => 51, :cid => 2, :no => 0, :data => "LastName_51")
      WebformSubmittedData.create(:nid => 5, :sid => 51, :cid => 3, :no => 0, :data => "Person_51@example.com")

      WebformSubmittedData.create(:nid => 5, :sid => 112, :cid => 1, :no => 0, :data => "FirstName_112")
      WebformSubmittedData.create(:nid => 5, :sid => 112, :cid => 2, :no => 0, :data => "LastName_112")
      WebformSubmittedData.create(:nid => 5, :sid => 112, :cid => 3, :no => 0, :data => "Person_112@example.com")

      WebformSubmittedData.count.should == 21

      @webformSubmissionHelper.refresh_volunteers

      Volunteer.count.should == 7

      volunteer16 = Volunteer.where(:id => 51).first
      volunteer21 = Volunteer.where(:id => 112).first

      volunteer16.name.should == "FirstName_51 LastName_51"
      volunteer16.email.should == "person_51@example.com"
      volunteer21.name.should == "FirstName_112 LastName_112"
      volunteer21.email.should == "person_112@example.com"

    end
  end
end