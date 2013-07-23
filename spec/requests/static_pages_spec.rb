require 'spec_helper'

describe "Static pages" do
  before do
    @title_base = "Ruby on Rails Tutorial Sample App"
  end
  
  describe "Home page" do
    it "should have the content 'Sample App' " do
      visit '/static_pages/home'
      page.should have_selector('h1', 'Sample App')
    end
    
    it "should have the right title" do
      visit '/static_pages/home'
      page.title.should == "#{@title_base} | Home"
    end
  end
  
  describe "Help page" do
    it "should have the content 'Help' " do
      visit '/static_pages/help'
      page.should have_selector('h1', 'Help')
    end
    
    it "should have the right title" do
      visit '/static_pages/help'
      page.title.should == "#{@title_base} | Help"
    end
  end
  
  describe "About page" do
    it "should have the content 'About Us' " do
      visit '/static_pages/about'
      page.should have_selector('h1', 'About Us')
    end
    
    it "should have the right title" do
      visit '/static_pages/about'
      page.title.should == "#{@title_base} | About Us"
    end
  end
  
  describe "Contact page" do
    it "should have the content 'Contact' " do
      visit '/static_pages/contact'
      page.should have_selector('h1', 'Contact')
    end
    
    it "should have my email address" do
      visit '/static_pages/contact'
      page.should have_selector('h1', 'imurchie@gmail.com')
    end
    
    it "should have the right title" do
      visit '/static_pages/contact'
      page.title.should == "#{@title_base} | Contact"
    end
  end
end
