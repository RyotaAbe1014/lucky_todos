class Todos::EditPage < MainLayout
  needs operation : SaveTodo
  needs todo : Todo
  quick_def page_title, "Edit Todo with id: #{todo.id}"

  def content
    link "Back to all Todos", Todos::Index
    h1 "Edit Todo with id: #{todo.id}"
    render_todo_form(operation)
  end

  def render_todo_form(op)
    form_for Todos::Update.with(todo.id) do
      # Edit fields in src/components/todos/form_fields.cr
      mount Todos::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
