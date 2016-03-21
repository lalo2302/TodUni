class RenameTablesColumnsFromSpanishToEnglish < ActiveRecord::Migration
  def change
  	change_table :cities do |t|
  		t.rename :nombre, :name
  		t.rename :id_estado, :state_id
  	end

	change_table :comments do |t|
  		t.rename :texto, :text
  		t.rename :id_proyecto, :project_id
  		t.rename :id_user, :user_id
  	end

  	change_table :states do |t|
  		t.rename :nombre, :name
  	end

  	change_table :stages do |t|
  		t.rename :numero_etapa, :stage_num
  		t.rename :descripcion, :description
  		t.rename :fecha_final, :due_date
  		t.rename :estatus, :status
  		t.rename :horas, :hours
  		t.rename :id_proyecto, :project_id
  	end

  	change_table :evidences do |t|
  		t.rename :titulo, :title
  		t.rename :descripcion, :description
  		t.rename :contenido, :content
  		t.rename :estatus, :status
  		t.rename :id_etapa, :stage_id
  		t.rename :id_user, :user_id
  	end

  	change_table :projects do |t|
  		t.rename :nombre, :name
  		t.rename :descripcion, :description
  		t.rename :coordenadas, :coordinates
  		t.rename :fecha_final, :due_date
  		t.rename :estatus, :status
  		t.rename :id_ciudad, :city_id
  	end

  	change_table :projects_hashtags do |t|
  		t.rename :id_proyecto, :project_id
  		t.rename :id_hashtag, :hashtag_id
  	end

  	change_table :projects_users do |t|
  		t.rename :id_proyecto, :project_id
  		t.rename :id_user, :user_id
  	end
  end
end
