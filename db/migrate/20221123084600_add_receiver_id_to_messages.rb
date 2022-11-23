class AddReceiverIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :reciever_id, :integer
  end
end
