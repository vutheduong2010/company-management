class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :company_code
      t.string :company_name
      t.string :branch_code
      t.string :branch_name
      t.string :address
      t.string :area
      t.string :email
      t.string :phone
      t.string :website
      t.string :status

      t.timestamps
    end
  end
end
