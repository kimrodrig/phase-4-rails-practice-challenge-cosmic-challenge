class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist

    validates :name, presence: true
    validates :scientist, uniqueness: true
    validates :planet, presence: true
end
