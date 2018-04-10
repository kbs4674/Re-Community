class CrawlingUnivSchedule < ApplicationRecord
    validates_uniqueness_of :title
end
