class Jobprofile < ActiveRecord::Base
  #geocoded_by :adresse
  #after_validation :geocode
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode, if: ->(obj) { obj.latitude.present? and obj.langitude.present? }  # auto-fetch address
  belongs_to :user
    #has_many :user
  # geocoded_by :adresse
  #after_validation :geocode
   has_many :demandes
  has_many :comments, dependent: :destroy
  has_many :plannings

  has_many_attached :gallery
    def thumbnail 
        return self.gallery.variant(resize: '300x300').processed

    end
    def self.recherche_filter(ville , tarif, namejob)
      if tarif=="1"
        t1 = 50
      elsif tarif=="2"
        t1 = 100
      else
        t1 = 200
      
      end
   
        if ville.blank?
          if tarif.blank?
           where(["namejob LIKE ?", "%#{namejob}%"])
          else
            where(["namejob like ? and tarif < ?", "%#{namejob}%","#{t1}" ])
          end
          if namejob.blank?
            where(["tarif < ?", "#{t1}"])
          end
        else
          if tarif.blank?
            if namejob.blank?
              where(["ville LIKE ?", "%#{ville}%"])
            else
              where(["namejob like ? and ville like ?", "%#{namejob}%","%#{ville}%" ])
            end
            
          else
            if namejob.blank?
              where(["ville LIKE ? and tarif < ?", "%#{ville}%", "#{t1}"])
            else
              where(["namejob like ? and ville like ? and tarif < ? ", "%#{namejob}%","%#{ville}%",  "#{t1}" ])
            end
          end
        end
      end
    
    def self.recherche_mot(mot)
      where(["namejob like ? or ville like ? or tarif like ?", "%#{mot}%","%#{mot}%",  "%#{mot}%" ])
    end
  def full_country
    "#{ville} #{adresse}"

  end

  scope :firstname, lambda {|firstname| where(["firstname LIKE :term", {:term => "%#{firstname}%"}]) }
  paginates_per 10
end
