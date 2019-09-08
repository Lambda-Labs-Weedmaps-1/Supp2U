class BusinessSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :image, :name, :website, :city, :state, :street, :zipcode, :building_number, :theme, :description, :long, :lat
  def image
    return unless object.image.attached?

    object.image.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: image_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(object.image)
  end
end
