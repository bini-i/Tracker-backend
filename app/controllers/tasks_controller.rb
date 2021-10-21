class TasksController < ApplicationController
    def index
        tasks = Task.all
        puts tasks[0].task_name
        render json: tasks
    end

    def create
        @task = Task.new(
            task_name: params[:task][:task_name], 
            description: params[:task][:description], 
            progress: params[:task][:progress]
            )
        if(@task.save)
            params[:task][:todos].each do |todo|
                @task.todos.create(
                    checked: todo[:checked],
                    value: todo[:value]
                )
            end
            render json: {status: 'OK'}, status: :created 
        else
            head(:unprocessable_entity)     
        end
    end

    def show

    end

    private

    def tasks_params 
        # todo separate in to two params
        params.require(:task).permit(:task_name, :description, :progress, todos: [:checked, :value])
    end

end
