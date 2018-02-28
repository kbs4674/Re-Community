class CrawlingNotice < ApplicationRecord
    validates_uniqueness_of :title, :link
end