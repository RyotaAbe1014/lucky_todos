class Todos::Update < BrowserAction
  put "/todos/:todo_id" do
    todo = TodoQuery.find(todo_id)
    SaveTodo.update(todo, params) do |operation, updated_todo|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_todo.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, todo: updated_todo
      end
    end
  end
end
