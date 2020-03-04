class Marker < ApplicationRecord
  # include 'geocode'
  belongs_to :user
  has_many_attached :images, service: :s3
  
  geocoded_by :address
  after_validation :geocode


  validates :status, presence: true
  validates :address, presence: true
  validates :address, uniqueness: true
  validates :description, length: { in: 10..500 }
  validates :zip_code, presence: true

  def define_lng_lat
    results = Geocoder.search(self.address)
    self.lat = results.first.coordinates[0]
    self.lng = results.first.coordinates[1]
  end

  def create_map
    self.map = "https://maps.googleapis.com/maps/api/staticmap?center=#{self.address}&size=300x300&zoom=17&markers=size:medium|color:brown|label:P|#{self.lat},#{self.lng}&key=#{Rails.application.credentials.google[:api_key]}"
  end

end
