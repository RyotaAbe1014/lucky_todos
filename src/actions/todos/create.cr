class Todos::Create < BrowserAction
  post "/todos" do
    SaveTodo.create(params) do |operation, todo|
      if todo
        flash.success = "The record has been saved"
        redirect Show.with(todo.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
