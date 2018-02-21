class Bug < ApplicationRecord
    validates :title,  presence: true
    validates :description,  presence: true

    enum status: [:open, :closed, :monitor]
    enum issue_type: [:issue, :enhancement, :feature]
    enum priority: [:low, :medium, :high]
end
