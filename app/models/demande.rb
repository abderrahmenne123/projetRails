class Demande < ApplicationRecord
    belongs_to :sender, foreign_key: :sender_id, class_name: "User"
    belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
    belongs_to :jobprofile
    #acts_as_notifiable :users, targets: Demande.recipient
    paginates_per 2
    has_many_attached :photo
    def thumbnail
        return self.photo.variant(resize: '300x300').processed

    end
    def self.recherche_demande(recherche_demande)
        if recherche_demande
            where(["body LIKE ?","%#{recherche_demande}%"])
        else
            all
        end

    end

end
