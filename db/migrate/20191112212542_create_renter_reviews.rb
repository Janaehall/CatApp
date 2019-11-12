class CreateRenterReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :renter_reviews do |t|
      t.integer :reservation_id
      t.integer :rating
      t.string :review
    end
  end
end
