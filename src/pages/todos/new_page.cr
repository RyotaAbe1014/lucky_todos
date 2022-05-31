class Todos::NewPage < MainLayout
  needs operation : SaveTodo
  quick_def page_title, "New Todo"

  def content
    h1 "New Todo"
    render_todo_form(operation)
  end

  def render_todo_form(op)
    form_for Todos::Create do
      # Edit fields in src/components/todos/form_fields.cr
      mount Todos::FormFields, op

      submit "作成", data_disable_with: "Saving...", class: "btn btn-primary"
    end
  end
end
