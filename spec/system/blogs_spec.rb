require 'rails_helper'

RSpec.describe 'Blog管理', type: :system do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit blogs_path
    click_link 'New Blog'
    fill_in 'Title', with: ''
    expect {
      click_button 'Save'
      sleep 1.0
    }.to change(Blog, :count).by(0)
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit blogs_path
    click_link 'New Blog'
    fill_in 'Title', with: 'title'
    expect {
      click_button 'Save'
      sleep 0.5
    }.to change(Blog, :count).by(1)
    expect(current_path).to eq blogs_path
    expect(page).to have_content 'ブログ「title」を登録しました。'
  end
end

