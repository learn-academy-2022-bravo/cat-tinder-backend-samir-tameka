require 'rails_helper'

RSpec.describe Cat, type: :model do
  
  describe "Create cat validations" do
    
    it "must contain a name" do
      cat = Cat.create age:45, hobbies:'scratching yarn', image: 'https://images.unsplash.com/photo-1616128417743-c3a6992a65e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'
      expect(cat.errors[:name]).to_not be_empty 
    end
    
    it "must contain a age" do
      cat = Cat.create name: 'lil meeks', hobbies:'scratching yarn', image: 'https://images.unsplash.com/photo-1616128417743-c3a6992a65e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'
      expect(cat.errors[:age]).to_not be_empty 
    end
    
    it "must contain a hobbies" do
      cat = Cat.create name: 'lil meeks', age:45, image: 'https://images.unsplash.com/photo-1616128417743-c3a6992a65e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'
      expect(cat.errors[:hobbies]).to_not be_empty 
    end

    it "hobbies must contain at least 10 characters" do
      cat = Cat.create name: 'lil meeks', age:45, hobbies:'chillin', image: 'https://images.unsplash.com/photo-1616128417743-c3a6992a65e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'
      expect(cat.errors[:hobbies]).to_not be_empty 
    end

    it "must contain a image" do
      cat = Cat.create name: 'lil meeks', age:45, hobbies:'scratching yarn'
      expect(cat.errors[:image]).to_not be_empty 
    end
    
  end

end
