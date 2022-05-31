class Todos::Delete < BrowserAction
  delete "/todos/:todo_id" do
    todo = TodoQuery.find(todo_id)
    DeleteTodo.delete(todo) do |_operation, _deleted|
      flash.success = "Deleted the todo"
      redirect Index
    end
  end
end
