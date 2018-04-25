require "rails_helper"

describe "/word-count/new" do
  it "parrots back the submitted text", points: 1 do
    visit "/word-count/new"

    fill_in "Text",
      with: "the first draft is just you telling yourself the story"

    fill_in "Special Word (optional)",
      with: "the"

    click_button "Calculate!"

    expect(page).to have_css(".text", text: "the first draft is just you telling yourself the story")
  end
end

describe "/word-count/new" do
  it "displays the word count", points: 16, hint: I18n.t("hints.two") do
    visit "/word-count/new"

    fill_in "Text",
      with: "the first draft is just you telling yourself the story"

    click_button "Calculate!"

    expect(page).to have_css(".word_count", text: 10)
  end
end

describe "/word-count/new" do
  it "displays the character count with spaces", points: 4, hint: I18n.t("hints.three") do
    visit "/word-count/new"

    fill_in "Text",
      with: "the first draft is just you telling yourself the story"

    click_button "Calculate!"

    expect(page).to have_css(".character_count_with_spaces", text: 54)
  end
end

describe "/word-count/new" do
  it "displays the character count without spaces", points: 12, hint: I18n.t("hints.four") do
    visit "/word-count/new"

    fill_in "Text",
      with: "the first draft is just you telling yourself the story"

    click_button "Calculate!"

    expect(page).to have_css(".character_count_without_spaces", text: 45)
  end
end

describe "/word-count/new" do
  it "displays the count of the special word occurrences", points: 16, hint: I18n.t("hints.five") do
    visit "/word-count/new"

    fill_in "Text",
      with: "the first draft is just you telling yourself the story"

    fill_in "Special Word (optional)",
      with: "the"

    click_button "Calculate!"

    expect(page).to have_css(".occurrences", text: 2)
  end
end

describe "/word-count/new" do
  it "displays the word count with mixed case text as input", points: 1 do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story"

    click_button "Calculate!"

    expect(page).to have_css(".word_count", text: 10)
  end
end

describe "/word-count/new" do
  it "displays the character count with spaces with mixed case text as input", points: 1 do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story"

    click_button "Calculate!"

    expect(page).to have_css(".character_count_with_spaces", text: 54)
  end
end

describe "/word-count/new" do
  it "displays the character count without spaces with mixed case text as input", points: 1, hint: I18n.t("hints.six") do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story"

    click_button "Calculate!"

    expect(page).to have_css(".character_count_without_spaces", text: 45)
  end
end

describe "/word-count/new" do
  it "displays the count of the special word occurrences with mixed case text as input", points: 4 do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story"

    fill_in "Special Word (optional)",
      with: "the"

    click_button "Calculate!"

    expect(page).to have_css(".occurrences", text: 2)
  end
end

describe "/word-count/new" do
  it "displays the word count if text with punctuation is used for input", points: 1 do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story."

    click_button "Calculate!"

    expect(page).to have_css(".word_count", text: 10)
  end
end

describe "/word-count/new" do
  it "displays the character count with spaces if text with punctuation is used for input", points: 1 do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story."

    click_button "Calculate!"

    expect(page).to have_css(".character_count_with_spaces", text: 55)
  end
end

describe "/word-count/new" do
  it "displays the character count without spaces if text with punctuation is used for input", points: 1 do
    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story."

    click_button "Calculate!"

    expect(page).to have_css(".character_count_without_spaces", text: 46)
  end
end

describe "/word-count/new" do
  it "displays the count of the special word occurrences if text with punctuation is used for input", points: 4, hint: I18n.t("hints.seven") do

    visit "/word-count/new"

    fill_in "Text",
      with: "The first draft is just you telling yourself the story."

    fill_in "Special Word (optional)",
      with: "story"

    click_button "Calculate!"

    expect(page).to have_css(".occurrences", text: 1)
  end
end

describe "loan payment" do
  it "displays the submitted APR", points: 1 do
    visit "/loan-payment/new"
    fill_in "annual_percentage_rate", with: 4.5
    fill_in "number_of_years", with: 30
    fill_in "principal_value", with: 50000
    click_button "Calculate!"

    expect(page).to have_content "4.5%"
  end
end

describe "loan payment" do
  it "displays the submitted number of years", points: 1 do
    visit "/loan-payment/new"
    fill_in "annual_percentage_rate", with: 4.5
    fill_in "number_of_years", with: 30
    fill_in "principal_value", with: 50000
    click_button "Calculate!"

    expect(page).to have_content 30
  end
end

describe "loan payment" do
  it "displays the submitted principal", points: 1 do
    visit "/loan-payment/new"
    fill_in "annual_percentage_rate", with: 4.5
    fill_in "number_of_years", with: 30
    fill_in "principal_value", with: 50000
    click_button "Calculate!"

    expect(page).to have_content "$50,000"
  end
end

describe "loan payment" do
  it "displays the calculated monthly payments", points: 32, hint: I18n.t("hints.eight") do
    visit "/loan-payment/new"
    fill_in "annual_percentage_rate", with: 4.5
    fill_in "number_of_years", with: 30
    fill_in "principal_value", with: 50000
    click_button "Calculate!"

    expect(page).to have_content "$253.34"
  end
end

describe "/time-between/new" do
  before do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"
  end
end

describe "/time-between/new" do
  it "displays the starting time", points: 1 do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "4:00pm"
    expect(page).to have_content "April 16, 2015"
  end
end

describe "/time-between/new" do
  it "displays the ending time", points: 1 do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "4:02pm"
    expect(page).to have_content "April 17, 2015"
  end
end

describe "/time-between/new" do
  it "displays the seconds between", points: 18, hint: I18n.t("hints.nine") do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "86520"
  end
end

describe "/time-between/new" do
  it "displays the minutes between", points: 3, hint: I18n.t("hints.ten") do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "1442"
  end
end

describe "/time-between/new" do
  it "displays the hours between", points: 3 do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "24.0333"
  end
end

describe "/time-between/new" do
  it "displays the days between", points: 3 do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "1.0013"
  end
end

describe "/time-between/new" do
  it "displays the weeks between", points: 3 do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "0.1430"
  end
end

describe "/time-between/new" do
  it "displays the years between", points: 3 do
    visit "/time-between/new"
    fill_in "starting_time", with: "04/16/2015 4:00 PM"
    fill_in "ending_time", with: "04/17/2015 4:02 PM"
    click_button "Calculate!"

    expect(page).to have_content "0.0027"
  end
end

describe "/stats/new" do
  it "parrots back the submitted numbers as an array for dataset 1", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".numbers", text: [10.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 8.0, 9.0])
  end
end

describe "/stats/new" do
  it "displays the numbers as a sorted array for dataset 1", points: 4 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".sorted_numbers", text: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 8.0, 9.0, 10.0])
  end
end

describe "/stats/new" do
  it "displays the count of numbers for dataset 1", points: 4 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".count", text: 11)
  end
end

describe "/stats/new" do
  it "displays the lowest number for dataset 1", points: 4 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".minimum", text: 1.0)
  end
end

describe "/stats/new" do
  it "displays the highest number for dataset 1", points: 4 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".maximum", text: 10.0)
  end
end

describe "/stats/new" do
  it "displays the range for dataset 1", points: 8 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".range", text: 9.0)
  end
end

describe "/stats/new" do
  it "displays the median of the numbers for dataset 1", points: 12 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".median", text: 6.0)
  end
end

describe "/stats/new" do
  it "displays the sum of the numbers for dataset 1", points: 5 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".sum", text: 63.0)
  end
end

describe "/stats/new" do
  it "displays the mean of the numbers for dataset 1", points: 8 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".mean", text: 5.72)
  end
end

describe "/stats/new" do
  it "displays the variance of the numbers for dataset 1", points: 24, hint: I18n.t("hints.eleven") do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".variance", text: 8.01)
  end
end

describe "/stats/new" do
  it "displays the standard deviation for dataset 1", points: 8, hint: I18n.t("hints.twelve") do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".standard_deviation", text: 2.83)
  end
end

describe "/stats/new" do
  it "displays the mode of the numbers for dataset 1", points: 8 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
    click_button "Calculate!"

    expect(page).to have_css(".mode", text: 8.0)
  end
end


describe "/stats/new" do
  it "displays the numbers as a sorted array with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".sorted_numbers", text: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 8.0, 10.0])
  end
end

describe "/stats/new" do
  it "displays the count of numbers with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".count", text: 10)
  end
end

describe "/stats/new" do
  it "displays the lowest number with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".minimum", text: 1.0)
  end
end

describe "/stats/new" do
  it "displays the highest number with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".maximum", text: 10.0)
  end
end

describe "/stats/new" do
  it "displays the range with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".range", text: 9.0)
  end
end

describe "/stats/new" do
  it "displays the median of the numbers with dataset 2", points: 9 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".median", text: 5.5)
  end
end

describe "/stats/new" do
  it "displays the sum of the numbers with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".sum", text: 54.0)
  end
end

describe "/stats/new" do
  it "displays the mean of the numbers with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".mean", text: 5.4)
  end
end

describe "/stats/new" do
  it "displays the variance of the numbers with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".variance", text: 7.64)
  end
end

describe "/stats/new" do
  it "displays the standard deviation with dataset 2", points: 1 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".standard_deviation", text: 2.76)
  end
end

describe "/stats/new" do
  it "displays the mode of the numbers with dataset 2", points: 5 do
    visit "/stats/new"
    fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
    click_button "Calculate!"

    expect(page).to have_css(".mode", text: 8.0)
  end
end
