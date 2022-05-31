class Todos::ShowPage < MainLayout
  needs todo : Todo
  quick_def page_title, "Todo with id: #{todo.id}"

  def content
    link "Back to all Todos", Todos::Index
    h1 "Todo with id: #{todo.id}"
    render_actions
    render_todo_fields
  end

  def render_actions
    section do
      link "Edit", Todos::Edit.with(todo.id)
      text " | "
      link "Delete",
        Todos::Delete.with(todo.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_todo_fields
    ul do
      li do
        text "title: "
        strong todo.title.to_s
      end
      li do
        text "content: "
        strong todo.content.to_s
      end
    end
  end
end
