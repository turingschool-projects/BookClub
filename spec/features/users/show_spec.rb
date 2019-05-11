require 'rails_helper'

# As a Visitor,
# When I click on a user's name for any book review
# I am taken to a show page for that user.
# I should see all reviews that this
# user has written.
# Each review shows:
# - the title of the review
# - the description of the review
# - the rating of the review
# - the title of the book
# - the thumbnail image for the book
# - the date the review was written


RSpec.describe 'when clicking on a users name on the books show page' do
  describe 'I am takin to a page with that users information' do

    before :each do
      @book_1 = Book.create!(title: 'Book 1', published: 1967, pages: 155, image_url: 'https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg')
      @book_2 = Book.create!(title: 'Book 2', published: 1965, pages: 245, image_url: 'https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg')
      @book_3 = Book.create!(title: 'Book 3', published: 2018, pages: 33, image_url: 'https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg')
      @book_4 = Book.create!(title: 'Book 4', published: 2002, pages: 33, image_url: 'https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg')
      @book_5 = Book.create!(title: 'Book 5', published: 2007, pages: 33, image_url: 'https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg')
      @user_1 = User.create!(name: "User 1")
      @user_2 = User.create!(name: "User 2")
      @review_1 = Review.create!(title: 'Review 1 Title', rating: 2, body: 'content 1', book: @book_1, user: @user_1)
      @review_2 = Review.create!(title: 'Review 2 Title', rating: 3, body: 'content 2', book: @book_2, user: @user_1)
      @review_3 = Review.create!(title: 'Review 3 Title', rating: 4, body: 'content 3', book: @book_3, user: @user_1)
      @review_4 = Review.create!(title: 'Review 4 Title', rating: 5, body: 'content 4', book: @book_4, user: @user_1)
      @review_5 = Review.create!(title: 'Review 5 Title', rating: 2, body: 'content 5', book: @book_5, user: @user_1)
      @review_6 = Review.create!(title: 'Review 6 Title', rating: 2, body: 'content 6', book: @book_1, user: @user_2)
    end

    it 'shows all reviews made by that user' do
      visit book_path(@book_1)

      click_link @user_1.name

      expect(current_path).to eq(user_path(@user_1))

      within "#review-#{@review_1.id}" do
        date_created = "#{@review_1.created_at.month}/#{@review_1.created_at.day}/#{@review_1.created_at.year}"

        expect(page).to have_content(@review_1.title)
        expect(page).to have_content(@review_1.body)
        expect(page).to have_content(@review_1.rating)
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(date_created)
        find "img[src='https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg']"
      end

      within "#review-#{@review_2.id}" do
        date_created = "#{@review_2.created_at.month}/#{@review_2.created_at.day}/#{@review_2.created_at.year}"

        expect(page).to have_content(@review_2.title)
        expect(page).to have_content(@review_2.body)
        expect(page).to have_content(@review_2.rating)
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(date_created)
        find "img[src='https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg']"
      end

      within "#review-#{@review_3.id}" do
        date_created = "#{@review_3.created_at.month}/#{@review_3.created_at.day}/#{@review_3.created_at.year}"

        expect(page).to have_content(@review_3.title)
        expect(page).to have_content(@review_3.body)
        expect(page).to have_content(@review_3.rating)
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(date_created)
        find "img[src='https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg']"
      end

      within "#review-#{@review_4.id}" do
        date_created = "#{@review_4.created_at.month}/#{@review_4.created_at.day}/#{@review_4.created_at.year}"

        expect(page).to have_content(@review_4.title)
        expect(page).to have_content(@review_4.body)
        expect(page).to have_content(@review_4.rating)
        expect(page).to have_content(@book_4.title)
        expect(page).to have_content(date_created)
        find "img[src='https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg']"
      end

      within "#review-#{@review_5.id}" do
        date_created = "#{@review_5.created_at.month}/#{@review_5.created_at.day}/#{@review_5.created_at.year}"

        expect(page).to have_content(@review_5.title)
        expect(page).to have_content(@review_5.body)
        expect(page).to have_content(@review_5.rating)
        expect(page).to have_content(@book_5.title)
        expect(page).to have_content(date_created)
        find "img[src='https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg']"
      end

    end

  end
end
