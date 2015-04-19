Given 'a user:' do |table|
  create :user, table.rows_hash
end

Given 'I visit Login page' do
  visit login_path
end

When 'I fill $field with "$value"' do |field, value|
  fill_in field, with: value
end

When 'I press $button' do |button|
  click_button button
end

Then 'I redirected to "$path"' do |path|
  expect(current_path).to eq path
end

Then 'I see $notification: "$message"' do |notification, message|
  expect(page).to have_selector "div.alert-#{notification}", text: message
end

Given 'I\'m logged in as a Student' do
  student = User.student.first || create(:student)

  visit login_path
  fill_in :login, with: student.login
  fill_in :password, with: 'secret'
  click_button 'Login'
end
