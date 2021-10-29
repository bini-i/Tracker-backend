class TasksController < ApplicationController
    def index
        tasks = current_user.tasks
        all_tasks_json = []
        tasks.each do |task|
            task_json = task.as_json
            task_json["todos"] = task.todos.as_json
            
            all_tasks_json.push(task_json)
        end
        render json: all_tasks_json
    end

    def create
        @task = current_user.tasks.create(
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
            render json: {id: @task.id, todos: @task.todos}, status: :created 
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
                if(@todo)
                    @todo.update(
                        checked: todo[:checked],
                        value: todo[:value]
                    )
                else
                    @task.todos.create(
                        checked: todo[:checked],
                        value: todo[:value]
                    )
                end
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
