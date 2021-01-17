class TeamRelationship < ApplicationRecord
    belongs_to :home, class_name: "Team"
    belongs_to :away, class_name: "Team"
    has_many :matches
end
