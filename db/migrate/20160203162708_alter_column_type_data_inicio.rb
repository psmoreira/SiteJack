class AlterColumnTypeDataInicio < ActiveRecord::Migration
  def self.up
      change_table :eventos do |t|
        t.change :dataInicio, :date
      end
    end
    def self.down
      change_table :eventos do |t|
        t.change :dataInicio, :datetime
      end
    end
end
