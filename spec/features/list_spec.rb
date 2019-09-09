# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'ListViews', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  it 'has a list index' do
    visit root_path
    click_link('LISTS')
    expect(page).to have_css('table', text: 'Title')
  end

  it 'has a form to create new list' do
    visit lists_path
    click_link('plus')
    expect(page).to have_css('form', text: 'Title')
  end

  it 'has a show view' do
    list_with('Exampletitle')
    click_link('show')
    expect(page).to have_css('table', text: 'Title Details Date')
    expect(page).to have_content('Exampletitle')
  end

  it 'has a edit view' do
    list_with('Exampletitle')
    click_link('edit')
    expect(page).to have_css('form', text: 'Title')
  end

  it 'can create new list' do
    list_with('Exampletitle')
    expect(page).to have_content('Exampletitle')
  end

  it 'can edit a list' do
    list_with('Exampletitle')
    click_link('edit')
    fill_in 'Title', with: 'NewExampletitle'
    click_button('Update List')
    visit lists_path
    expect(page).to have_content('NewExampletitle')
  end

  it 'can delete a list' do
    list_with('Exampletitle')
    click_link('delete')
    expect(page).to_not have_content('Exampletitle')
  end

  def list_with(title)
    visit new_list_path
    fill_in 'Title', with: title
    click_button('Create List')
    visit lists_path
  end
end
