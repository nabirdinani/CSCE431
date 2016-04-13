require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

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

When /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^I check "([^\"]*)"$/ do |field|
  check(field)
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should_not have_content(regexp)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should_not =~ /#{value}/
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  find_field(label).should be_checked
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  find_field(label).should_not be_checked
end

Then /^I should be on (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

Then /^I should not be on (.+)$/ do |page_name|
  current_path.should_not == path_to(page_name)
end

Then /^page should have (.+) message "([^\"]*)"$/ do |type, text|
  page.has_css?("p.#{type}", :text => text, :visible => true)
end

Given /^the following users$/ do |table|
  table.hashes.each do |hash|
    User.create(:name => hash[:name],
      :phone => hash[:phone],
      :email => hash[:email],
      :password => hash[:password])
  end
end

Given /^the following artworks$/ do |table|
  table.hashes.each do |hash|
    Artwork.create(:name => hash[:name],
      :description => hash[:description],
      :attachment => hash[:attachment])
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