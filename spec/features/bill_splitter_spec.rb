require 'spec_helper'

feature 'Splitting a bill' do
  scenario 'A user can split a £100 between 10 people' do
    visit '/'
    fill_in 'bill_total', :with => 100
    fill_in 'people_count', :with => 10
    click_button 'Split bill'
    expect(page).to have_content '£10'
  end

  scenario 'A user can split a £100 between 5 people' do
    visit '/'
    fill_in 'bill_total', :with => 100
    fill_in 'people_count', :with => 5
    click_button 'Split bill'
    expect(page).to have_content '£20'
  end


end
