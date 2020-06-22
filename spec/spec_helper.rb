RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = :random
  Kernel.srand config.seed
  # config.profile_examples = 10
end

def sign_up_user(username)
  visit '/users/new'

  fill_in 'user[username]', with: username
  click_on 'Create'
end

def login_user(username)
  visit '/login'
  fill_in 'session[username]', with: username
  click_on 'Login'
end

def create_event(title, description, event_date = nil)
  visit '/events/new'

  fill_in 'event[title]', with: title
  fill_in 'event[description]', with: description
  fill_in 'event[event_date]', with: event_date if event_date
  click_on 'Create'
end

def logout_user
  visit '/logout'
end
