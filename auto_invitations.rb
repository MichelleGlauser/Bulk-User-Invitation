require 'rubygems'
require 'mechanize'

browser = Mechanize.new
browser.follow_meta_refresh = true

browser.get('https://fpinvite.getsatisfaction.com/companies/1/users/login') do |login_page|
  login_page.form_with(:action => 'https://fpinvite.getsatisfaction.com/companies/1/users/login_check') do |f|
    f.field_with(:id => "loginform_useremail").value = 'admin@abc.com'
    f.field_with(:id => "loginform_userpassword").value = 'abc'
  end.click_button
end

browser.get('https://fpinvite.getsatisfaction.com/companies/1/users/new') do |invite_page|

new_users = Array.new

file = File.new('input_file.txt', 'r')
file.each_line("\n") do |row|
  puts row + "\n"
  columns = row.split(",")
#  new_users.push columns
end

  new_users = [
    ['test@getsatisfaction.com', 'jane smith'],
    ['test@getsatisfaction.com', 'joe smith']
  ]
  
  new_users.each_with_index do |user|
    invite_page.form_with(:id => 'new_user') do |f|
      f.field_with(:id => "user_email").value = user[0]
      f.field_with(:id => "user_name").value = user[1]
    end.click_button
  end
end