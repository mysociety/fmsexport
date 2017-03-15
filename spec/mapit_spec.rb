require 'spec_helper'

describe Fmsexport::Mapit do

  let(:mapit) { described_class.new }

  it 'gets area children' do
    areas = mapit.area_children(2561)
    expect(areas.count).to eq(69)
    expect(areas['148666']).to eq({
       "parent_area"=>2561,
       "generation_high"=>30,
       "all_names"=>{},
       "id"=>148666,
       "codes"=>{"gss"=>"E05010885", "unit_id"=>"747"},
       "name"=>"Ashley",
       "country"=>"E",
       "type_name"=>"Unitary Authority ward (UTW)",
       "generation_low"=>28,
       "country_name"=>"England",
       "type"=>"UTW"
     })
  end

end
