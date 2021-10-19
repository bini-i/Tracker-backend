class TasksController < ApplicationController
    def index
        tasks = Task.all
    end

    def create
        @task = Task.new(
            task_name: params[:task][:task_name], 
            description: params[:task][:description], 
            progress: params[:task][:progress]
            )
        puts(@task.task_name)
        if(@task.save)
            params[:task][:todos].each do |todo|
                @task.todos.create(
                    checked: params[:task][:todos][:checked],
                    value: params[:task][:todos][:value]
                    )
                end
            puts('saved~~~~~~~~~~')
            render json: {status: 'OK'}, status: :created 
        else
            head(:unprocessable_entity)     
        end
    end

    def show

    end

    def destroy

    end

    private

    def tasks_params 
        # todo separate in to two params
        params.require(:task).permit(:task_name, :description, :progress, todos: [:checked, :value])
    end

end
