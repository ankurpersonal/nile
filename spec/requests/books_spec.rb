require 'rails_helper'

describe "Books Api", type: :request do
	let(:first_author) { FactoryBot.create(:author, first_name:'test1', last_name: 'best', age:25)}
	let(:second_author) { FactoryBot.create(:author, first_name:'test2', last_name: 'best', age:27)}
	
	describe "GET /books" do

		before do
			FactoryBot.create(:book, title:'1984', author: first_author)
			FactoryBot.create(:book, title:'3', author: second_author)			
		end
		
		it "returns all books" do
			get '/api/v1/books'
			expect(response).to have_http_status(:success)
			expect(response_body.size).to eq(2)  
			expect(response_body).to eq(
				[{
					"id" => 1,
					"name"=> "1984",
					"author_name"=> "test1 best",
					"author_age"=> 25 
					},
					{
						"id" => 2,
						"name"=> "3",
						"author_name"=> "test2 best",
						"author_age"=> 27 
						}
				]
			)
			
		end
	end

	describe "POST /books" do
		it "create a new book" do
			expect {
				post '/api/v1/books', params: {
					book: {title: "The martian"},
					author: {first_name: 'Andy', last_name: "wire", age: 48}
				 }
			}.to change { Book.count }.from(0).to(1)
		
			expect(response).to have_http_status(:created) 
			expect(Author.count).to eq(1)
			expect(response_body).to eq(
				{
				"id" => 1,
				"name"=> "The martian",
				"author_name"=> "Andy wire",
				"author_age"=> 48 
				}
			)    
		end
	end
	
	describe "DELETE " do
	  context "/books/:id" do
		let!(:book) { FactoryBot.create(:book, title: '1984', author: first_author) }  #we added ! because to stop the lazy loading for book var,  it helps create book first in test db before full test execute 

		it "deletes a book" do
			expect {
				delete "/api/v1/books/#{book.id}"
			}.to change { Book.count }.from(1).to(0)

		  expect(response).to have_http_status(:no_content)  
		end
	  end
	end
end
