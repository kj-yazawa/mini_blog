require 'rails_helper'

RSpec.feature 'Entries', type: :system do
  scenario 'ブログAの詳細画面ではブログAのエントリーが表示されていること' do
    blog_a = FactoryBot.create(:blog, title: 'ブログA')
    blog_b = FactoryBot.create(:blog, title: 'ブログB')
    entry_a = FactoryBot.create(:entry, title: 'エントリーA', blog: blog_a)
    entry_b = FactoryBot.create(:entry, title: 'エントリーB', blog: blog_b)

    visit blogs_path
    visit blog_path(blog_a)
    expect(page).to have_content 'エントリーA'
    expect(page).to have_no_content 'エントリーB'
  end
end
