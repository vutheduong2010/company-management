class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :company_code
      t.string :company_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :website
      t.string :status

      t.timestamps
    end
  end
end
