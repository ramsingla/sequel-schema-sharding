Sequel.migration do
  change do
    create_table migration_schema_for_table(:artists) do
      Integer :id, null: false
      String :name, null: false
      Time :created_at
    end
  end
end


