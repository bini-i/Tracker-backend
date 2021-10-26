class TasksController < ApplicationController
    def index
        tasks = Task.all
        all_tasks_json = []
        tasks.each do |task|
            task_json = task.as_json
            task_json["todos"] = task.todos.as_json
            
            all_tasks_json.push(task_json)
        end
        render json: all_tasks_json
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

    def update
        @task = Task.find(params[:task][:id])
        if(@task.update(
            task_name: params[:task][:task_name], 
            description: params[:task][:description], 
            progress: params[:task][:progress]
            ))
            
            params[:task][:todos].each do |todo|
                @todo = Todo.find(todo[:id])
                @todo.update(
                    checked: todo[:checked],
                    value: todo[:value]
                )
            end

            render json: {status: 'OK'}, status: :ok 
        else 
            puts @task.errors.full_messages
            head(:unprocessable_entity)     
        end
    end

    private

    def tasks_params 
        # todo separate in to two params
        params.require(:task).permit(:task_name, :description, :progress, todos: [:checked, :value])
    end

end
