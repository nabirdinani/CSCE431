require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^the user "([^"]*)" is an admin$/) do |user|
  User.find_by_name(user).update_attribute :admin, true
end

Given /^the artwork has been approved/ do 
  @artwork = Artwork.first
  @artwork.update_attribute :approved, true
end

When /^I press the watch button/ do
  @artwork = Artwork.first
  click_button("upload_button_#{@artwork.id}")
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I click "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end


Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end


Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end



Then /^I should be on (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

Then /^I should not be on (.+)$/ do |page_name|
  current_path.should_not == path_to(page_name)
end


Given /^the following users$/ do |table|
  table.hashes.each do |hash|
    User.create(:name => hash[:name],
      :phone => hash[:phone],
      :email => hash[:email],
      :password => hash[:password])
  end
end


Given(/^the user "([^"]*)" is activated$/) do |arg1|
  User.find_by_name(arg1).activate
end

When /^I upload a file$/ do
  attach_file(:file_field, File.join(File.dirname(__FILE__), "..", "support", "upload-files", "1.jpg"))
  click_button "submit_file"
end

When /^I upload a file alternate$/ do
  attach_file(:file_field, File.join(File.dirname(__FILE__), "..", "support", "upload-files", "2.jpg"))
  click_button "submit_file"
end

When /^I upload wrong image file$/ do
  attach_file(:file_field, File.join(File.dirname(__FILE__), "..", "support", "upload-files", "1.pdf"))
  click_button "submit_file"
end
 
 
Then /^I see the link "(.*?)" to "(.*?)"$/ do |link,url|
  page.should have_link(link, :href => url)
end