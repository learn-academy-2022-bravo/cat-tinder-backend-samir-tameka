require 'rails_helper'

RSpec.describe "Cats", type: :request do
  
    describe "GET /index" do
      it "gets a list of cats" do
        Cat.create(
          name: 'Max',
          age: 5,
          hobbies: 'Barking at cars',
          image: 'https://unsplash.com/s/photos/jaguar'
        )
  
        get '/cats'
  
        cat = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(cat.length).to eq(1)
      end
    end

    describe "POST /create" do
      it "creates a cat" do
        cat_params = {
          cat: {
            name: 'Max',
            age: 5,
            hobbies: 'Barking at cars',
            image: 'https://unsplash.com/s/photos/jaguar'
          }
        }
  
        post '/cats', params: cat_params
  
        expect(response).to have_http_status(200)
        cat = Cat.first
        expect(cat.name).to eq('Max')
      end


      it "cannot create a cat without a name" do
        cat_params = {
          cat: {
            age: 5,
            hobbies: 'Barking at cars',
            image: 'https://unsplash.com/s/photos/jaguar'
          }
        }
  
        post '/cats', params: cat_params
        cat = Cat.first

        expect(response).to have_http_status(422)
        json = JSON.parse(response.body)
        expect(json['name']).to include "can't be blank"
      end




    end
 
    describe "PATCH /update" do
      it "updates an existing cat" do
        cat_params = {
          cat: {
            name: 'Max',
            age: 5,
            hobbies: 'Barking at cars',
            image: 'https://unsplash.com/s/photos/jaguar'
          }
        }
  
        post '/cats', params: cat_params
        cat = Cat.first

        update_cat_params = {
          cat: {
            name: 'Max',
            age: 5,
            hobbies: 'Running wild',
            image: 'https://unsplash.com/s/photos/jaguar'
          }
        }

        patch "/cats/#{cat.id}", params: update_cat_params
        updated_cat = Cat.find(cat.id)
        expect(response).to have_http_status(200)
        expect(updated_cat.hobbies).to eq('Running wild')
      end
    end
 

    describe "DELETE /destroy" do
      it "deletes an existing cat" do
        cat_params = {
          cat: {
            name: 'Max',
            age: 5,
            hobbies: 'Barking at cars',
            image: 'https://unsplash.com/s/photos/jaguar'
          }
        }
  
        post '/cats', params: cat_params
        cat = Cat.first
  
        delete "/cats/#{cat.id}", params: cat_params
        destroy_cat = Cat.find_by(id: cat.id)
        expect(destroy_cat).to be_nil
      end
    end

end
