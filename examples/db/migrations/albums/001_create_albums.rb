Sequel.migration do
  change do
    create_table migration_schema_for_table(:albums) do
      Integer :artist_id, null: false
      String :name, null: false
      Date :release_date
      Time :created_at
    end
  end
end

