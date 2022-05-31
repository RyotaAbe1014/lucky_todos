class Todos::Index < BrowserAction
  get "/todos" do
    html IndexPage, todos: TodoQuery.new
  end
end
