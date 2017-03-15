module Fmsexport
  class Report
    FIXED_STATES = ['fixed', 'fixed - council', 'fixed - user']
    OPEN_STATES = ['confirmed', 'investigating', 'in progress', 'planned', 'action scheduled']
    CLOSED_STATES = ['closed', 'unable to fix', 'not responsible', 'duplicate', 'internal referral']

    def self.generate(council_id, options = {})
      ward_list = Mapit.new.area_children(council_id)
      result = get_problems(council_id, options)
      CSV.generate do |csv|
        csv << ["title", "detail", "url", "created", "state", "whensent", "category", "lastupdate", "latitude", "longitude", "ward"]
        result.each do |p|
          csv << [ p.title, p.detail, p.url, p.created, p.state, p.whensent, p.category, p.lastupdate, p.latitude, p.longitude, p.ward(ward_list) ]
        end
      end
    end

    def self.get_problems(council_id, options)
      result = Problem.by_council(council_id)
      result = result.where(category: options[:category]) if options[:category]
      result = result.where('areas LIKE ?', "%,#{options[:area]}%") if options[:area]
      result = result.where(state: get_states(options[:state])) if options[:state]
      result
    end

    def self.get_states(state)
      if state == 'closed'
        CLOSED_STATES
      elsif state == 'open'
        OPEN_STATES
      elsif state == 'fixed'
        FIXED_STATES
      else
        [state]
      end
    end

  end
end
