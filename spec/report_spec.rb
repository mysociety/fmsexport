require 'spec_helper'
require 'csv'

describe Fmsexport::Report do

  it 'generates a CSV for a report' do
    report = Fmsexport::Report.generate('2561')
    csv = CSV.parse(report, headers: true)
    expect(csv.count).to eq(3594)
    expect(csv.first.to_h).to eq({
      "title"=>"Report 937341",
      "whensent" => "2016-12-05 11:35:12 UTC",
      "detail"=>"This is a report in the Road Signage category.",
      "url" => "https://www.fixmystreet.com/report/937341",
      "category" => "Road Signage",
      "created"=>"2016-12-05 11:32:28 UTC",
      "lastupdate"=>"2016-12-08 09:46:45 UTC",
      "state" => "confirmed",
      "latitude"=>"51.458415",
      "longitude"=>"-2.585505",
      "ward" => "Central",
    })
  end

  it 'filters by category' do
    report = Fmsexport::Report.generate('2561', category: 'Road Signage')
    csv = CSV.parse(report, headers: true)
    expect(csv.count).to eq(108)
  end

  it 'filters by area' do
    report = Fmsexport::Report.generate('2561', area: '148660')
    csv = CSV.parse(report, headers: true)
    expect(csv.count).to eq(138)
  end

  it 'filters by state' do
    report = Fmsexport::Report.generate('2561', state: 'fixed')
    csv = CSV.parse(report, headers: true)
    expect(csv.count).to eq(2030)
  end

  it 'filters by category and area' do
    report = Fmsexport::Report.generate('2561', area: '148660', category: 'Road Signage')
    csv = CSV.parse(report, headers: true)
    expect(csv.count).to eq(6)
  end

  it 'filters by category, area and state' do
    report = Fmsexport::Report.generate('2561', area: '148660', category: 'Dog fouling', state: 'open')
    csv = CSV.parse(report, headers: true)
    expect(csv.count).to eq(2)
  end

end
