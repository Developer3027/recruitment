class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.text :comment
      t.text :note
      t.boolean :pp_check

      t.timestamps
    end
  end
end
