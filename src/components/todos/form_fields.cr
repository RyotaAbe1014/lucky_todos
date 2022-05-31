class Todos::FormFields < BaseComponent
  needs operation : SaveTodo

  def render
    mount Shared::Field, operation.title, &.text_input(append_class: "form-control")
    mount Shared::Field, operation.content, &.textarea(rows: "10", cols: "20", append_class: "form-control")
  end
end
