class AddAttachmentColumnsToFuncionarios < ActiveRecord::Migration
  def up
    add_attachment :funcionarios, :avatar
  end

  def down
    remove_attachment :funcionarios, :avatar
  end
end
