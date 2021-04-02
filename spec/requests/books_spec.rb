require 'rails_helper'

describe "Books Api", type: :request do
	describe "GET /books" do
		before do
			authour = FactoryBot.create(:author, first_name:'test1', last_name: 'best', age:25)
			FactoryBot.create(:book, title:'3', author: 'asdf')			
		end
		
		it "returns all books" do
			get '/api/v1/books'
			expect(response).to have_http_status(:success)
			expect(JSON.parse(response.body).size).to eq(2)  
			
		end
	end

	describe "POST /books" do
		# it "create a new book" do
		# 	expect {
		# 		post '/api/v1/books', params: { book: {title: "the martian", author: 'andy wire'} }
		# 	}.to change { Book.count }.from(0).to(1)
		
		# 	expect(response).to have_http_status(:created)  
		# end

		it "create a new book" do
			expect {
				post '/api/v1/books', params: {
					book: {title: "the martian"},
					author: {first_name: 'andy ', last_name: "wire", age: 48}
				 }
			}.to change { Book.count }.from(0).to(1)
		
			expect(response).to have_http_status(:created) 
			expect(Author.count).to eq(1)   
		end



	end
	
	# describe "DELETE " do
	#   context "/books/:id" do
	# 	let!(:book) { FactoryBot.create(:book, title: '1984', author: 'george') }  #we added ! because to stop the lazy loading for book var,  it helps create book first in test db before full test execute 

	# 	it "deletes a book" do
	# 		expect {
	# 			delete "/api/v1/books/#{book.id}"
	# 		}.to change { Book.count }.from(1).to(0)

		  

	# 	  expect(response).to have_http_status(:no_content)  
	# 	end
	#   end
	# end
end
