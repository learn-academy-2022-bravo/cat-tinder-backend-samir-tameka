class CatsController < ApplicationController

    def index
        cats = Cat.all 
        render json: cats
    end
  
    def create
        cat = Cat.create(cat_params)
        render json: cat
    end
  
    def update
        cat = Cat.find(params[:id])
        cat.update(cat_params)
        render json: cat
    end
  
    def destroy
        cat = Cat.find(params[:id])
        cats = Cat.all

        if cat.destroy
            render json: cats
        else
            render json: cats.errors
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :age, :hobbies, :image)
    end

end
