class ScientistsController < ApplicationController

    def index
        render json: Scientist.all, status: :ok
    end

    def show
        render json: find_sci, serializer: ScientistShowSerializer
    end

    def update
        render json: find_sci.update(scientist_params), status: :accepted
    end

    def create
        render json: Scientist.create!(scientist_params), status: :created
    end

    def delete
        find_sci.destroy
        head :no_content 
    end

    private

    def find_sci
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end



end
