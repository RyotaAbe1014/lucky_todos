class Home::Index < BrowserAction
  get "/" do
    # html Home::IndexPage
    redirect to: Todos::Index, status: 301
  end
end
