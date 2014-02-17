class CreateSurvey < ActiveRecord::Migration
  def self.up

    # survey surveys logic
    create_table :surveys do |t|
      t.string  :name
      t.text    :description
      t.boolean :finished, :default => false
      t.boolean :active, :default => false

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :survey_id
      t.string  :text

      t.timestamps
    end

    create_table :options do |t|
      t.integer :question_id
      t.string :text

      t.timestamps
    end
 
    # Answer logic

    create_table :answers do |t|
      t.belongs_to    :user
      t.references    :option
      t.timestamps
    end

  end

  def self.down
    drop_table :surveys
    drop_table :questions
    drop_table :options
  end
end
