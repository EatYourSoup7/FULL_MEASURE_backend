class AddLngLatMapToMarkers < ActiveRecord::Migration[6.0]
  def change
    add_column :markers, :lng, :decimal, :precision => 15, :scale => 10, :default => 0.0
    add_column :markers, :lat, :decimal, :precision => 15, :scale => 10, :default => 0.0
    add_column :markers, :map, :string
  end
end
