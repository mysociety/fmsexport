require 'spec_helper'

describe Fmsexport::Problem do

  let(:ward_list) { JSON.parse(File.read File.join( File.dirname(__FILE__), 'fixtures', 'ward_list.json')) }

  it 'gets reports for a particular council' do
    expect(Fmsexport::Problem.by_council('2561').count).to eq(3594)
  end

  it 'gets the correct ward' do
    problem = Fmsexport::Problem.find(937341)
    expect(problem.ward(ward_list)).to eq('Central')
  end

  it 'returns a URL' do
    problem = Fmsexport::Problem.find(860823)
    expect(problem.url).to eq('https://www.fixmystreet.com/report/860823')
  end

end
