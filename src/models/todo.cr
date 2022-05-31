class Todo < BaseModel
  table do
    column title : String
    column content : String
  end
end
