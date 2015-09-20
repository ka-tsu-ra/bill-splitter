require 'spec_helper'

feature 'Splitting a bill' do
  scenario 'A user can split a £100 between 10 people' do
    visit '/'
    fill_in 'bill_total', with: 100
    fill_in 'people_count', with: 10
    click_button 'Split bill'
    expect(page).to have_content '10'
  end

  scenario 'A user can split a £100 between 5 people' do
    visit '/'
    fill_in 'bill_total', with: 100
    fill_in 'people_count', with: 5
    click_button 'Split bill'
    expect(page).to have_content '20'
  end

  scenario 'A user can also enter the total amounts and headcounts for alcoholic and non-alcoholic drinks' do
    visit '/'
    fill_in 'bill_total', with: 100
    fill_in 'total_booze', with: 20
    fill_in 'total_softdrinks', with: 10
    fill_in 'people_count', with: 10
    fill_in 'boozers', with: 4
    fill_in 'soft_drinkers', with: 4
    click_button 'Split bill'
    expect(page).to have_content "{:just_food=>7, :food_and_booze=>12, :food_and_softdrinks=>9}"
  end


end
