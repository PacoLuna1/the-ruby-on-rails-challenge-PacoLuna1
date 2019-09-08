# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'TaskViews', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  it 'has a task index' do 
    list_with('Examplelist')
   
    expect(page).to have_css('table', text: 'Title Details Date')
  end

  it 'has a form to create new task' do 
    list_with('Examplelist')
    click_link('plus_task')
    expect(page).to have_css('form')
    expect(page).to have_button('Create Task')
  end

  it 'has a show view' do 
    task_with('Exampletask','Make an example','2019-09-08')
    click_link('show_task')
    expect(page).to have_content('Title: Exampletask')
    expect(page).to have_content('Details: Make an example')
    expect(page).to have_content('Date: 2019-09-08')
  end

  it 'has a edit view' do 
    task_with('Exampletask','Make an example','2019-09-08')
    click_link('edit_task')
    expect(page).to have_css('form')
    expect(page).to have_content('Title:')
    expect(page).to have_content('Details:')
    expect(page).to have_content('Date:')
  end

  it 'can create new task' do 
    task_with('Exampletask','Make an example','2019-09-08')
    expect(page).to have_content('Exampletitle')
    expect(page).to have_content('Make an example')
    expect(page).to have_content('2019-09-08')
  end

  it 'can edit a task' do 
    task_with('Exampletask','Make an example','2019-09-08')
    click_link('edit_task')
    fill_in 'Title_task', with: 'NewExampletitle'
    click_button('Update Task')
    expect(page).to have_content('NewExampletitle')
  end

  it 'can delete a task' do 
    task_with('Exampletask','Make an example','2019-09-08')
    click_link('delete_task')
    expect(page).to_not have_content('Exampletask')
    expect(page).to_not have_content('Make an example')
    expect(page).to_not have_content('2019-09-08')
  end

  def list_with(title)
    visit new_list_path
    fill_in 'Title', with: title
    click_button('Create List')
  end
  def task_with(title,details,date)
    list_with('Exampletitle')
    click_link('plus_task')
    fill_in 'Title_task', with: title
    fill_in 'Details_task', with: details
    fill_in 'Date_task', with: date
    click_button('Create Task')
  end
end