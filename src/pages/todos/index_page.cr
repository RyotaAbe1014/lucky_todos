class Todos::IndexPage < MainLayout
  needs todos : TodoQuery
  quick_def page_title, "todo一覧"

  def content
    h1 "Todo一覧画面"
    link "新規todo作成", to: Todos::New
    render_todos
  end

  def render_todos
    todos.each do |todo|
      div class: "card" do
        div class: "card-body" do
          h4 todo.title, class: "card-title"
          para todo.content, class: "card-text"
          link "詳細", to: Todos::Show.with(todo.id), class: "btn btn-primary"
        end
      end
    end
  end
end
