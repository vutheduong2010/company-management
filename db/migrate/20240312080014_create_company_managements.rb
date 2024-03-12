class CreateCompanyManagements < ActiveRecord::Migration[7.1]
  def change
    create_table :company_managements do |t|
      t.string :company
      t.string :email, null: false
      t.string :phone_number
      t.string :status
      t.timestamps
    end
  end
end
