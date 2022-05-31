class CreateTodos::V20220530122914 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Todo) do
      primary_key id : Int64
      add_timestamps
      add title : String
      add content : String
    end
  end

  def rollback
    drop table_for(Todo)
  end
end
