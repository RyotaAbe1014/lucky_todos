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
          link "編集", to: Todos::Edit.with(todo.id), class: "btn btn-success"
          link "削除", to: Todos::Delete.with(todo.id), class: "btn btn-danger", data_confirm: "本当に削除しますか？"
        end
      end
    end
  end
end
