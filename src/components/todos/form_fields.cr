class Todos::FormFields < BaseComponent
  needs operation : SaveTodo

  def render
    mount Shared::Field, operation.title, &.text_input(autofocus: "true")
    mount Shared::Field, operation.content
  end
end
