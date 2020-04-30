class CreateApiAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :api_access_tokens do |t|
      t.integer :account_id
      t.string :key

      t.timestamps
    end
  end
end
