class Api::V1::TodosController < ApplicationController

	def index
		@todos = Todo.all
		render json: @todos, status: :ok
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			render json: @todo.as_json, status: :created
		else
			render json: {errors: @todo.errors}, status: :unprocessable_entity
		end
	end


	def update
		    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
    else
      render json: {errors: @todo.errors}, status: :unprocessable_entity
    end
	end


	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
	end


	private

	def todo_params
		params.permit(:title, :order, :completed)
	end
end


