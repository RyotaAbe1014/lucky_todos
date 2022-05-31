class Todos::Show < BrowserAction
  get "/todos/:todo_id" do
    html ShowPage, todo: TodoQuery.find(todo_id)
  end
end
