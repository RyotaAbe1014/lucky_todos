class Todos::Edit < BrowserAction
  get "/todos/:todo_id/edit" do
    todo = TodoQuery.find(todo_id)
    html EditPage,
      operation: SaveTodo.new(todo),
      todo: todo
  end
end
