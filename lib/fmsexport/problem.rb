module Fmsexport
  class Problem < ActiveRecord::Base
    self.table_name = "problem"

    def self.by_council(council)
      where('bodies_str LIKE ?', "%#{council}%")
    end

    def ward(ward_list)
      areas = self.areas.split(',').reject!(&:empty?)
      areas.each { |a| return ward_list[a]['name'] if !ward_list[a].nil? }
    end

    def url
      "https://www.fixmystreet.com/report/#{self.id}"
    end
  end
end
