Given 'a course:' do |table|
  options = table.rows_hash
  options[:students] = User.where login: options[:students].split(', ')
  options[:teachers] = User.where login: options[:teachers].split(', ')

  create :course, options
end

Given 'a learning unit:' do |table|
  options = table.rows_hash
  options[:course] = Course.find_by(title: options[:course])

  create :learning_unit, options
end

Given 'a activity:' do |table|
  options = table.rows_hash
  options[:learning_unit] = LearningUnit.find_by(title: options[:learning_unit])

  create :activity, options
end

Given 'I\'m on activity "$activity_title"' do |activity_title|
  activity = Activity.find_by(title: activity_title)

  within 'nav' do
    click_on activity.learning_unit.course.title
  end

  click_on activity.title

  expect(current_path).to eq(
    course_learning_unit_activity_path(activity.learning_unit.course, activity.learning_unit, activity)
  )
end

When 'I upload file "$file_name"' do |_file_name|
  click_on 'Upload File'

  expect(current_path).to eq new_upload_file_path

  attach_file('File', 'spec/fixtures/calculations.txt')

  expect do
    click_button 'Create Upload file'
  end.to change(UploadFile, :count).by 1
end

Then 'I see uploaded file "$file_name"' do |file_name|
  activity = Activity.last

  expect(current_path).to eq(
    course_learning_unit_activity_path(activity.learning_unit.course, activity.learning_unit, activity)
  )

  expect(page).to have_selector 'li', file_name
end
