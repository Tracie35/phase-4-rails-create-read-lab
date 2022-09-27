
class PlantsController < ApplicationController
    
     # GET '/plants'
    def index
        plants = Plant.all
        render json: plants,  only: [:name, :image, :price] status: :ok
    end

     # GET 'plants/:id'
    def show
        plant = Plant.find_by(id: params[:id])
         if plant
            render json: plant, status: 200
        else
            render json: {"error": "Plant not found"}, status: 404
        end
    end
     
    
    # POST '/plants'
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end
end

   
