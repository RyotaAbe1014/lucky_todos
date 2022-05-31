class Todos::Index < BrowserAction
  get "/todos" do
    pages, todos = paginate(TodoQuery.new)
    html IndexPage, todos: todos, pages: pages
  end
end
