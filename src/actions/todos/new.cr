class Todos::New < BrowserAction
  get "/todos/new" do
    html NewPage, operation: SaveTodo.new
  end
end
