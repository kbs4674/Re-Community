class CrawlingSubway < ApplicationRecord
    validates_uniqueness_of :title
end
