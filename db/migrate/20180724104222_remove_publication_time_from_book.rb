class RemovePublicationTimeFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :publication_time, :date
  end
end
