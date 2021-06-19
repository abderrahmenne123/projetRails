class JobprofileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :adresse,
             :ville,
             :tarif,
             :user_id,
             :namejob,
             :gallery



  def images
    return unless object.gallery.attachments
    image_urls = object.gallery.map do |image|
      URI.join(
        ActionController::Base.asset_host,
        rails_blob_path(image))
    end

    image_urls
  end
  end
