require 'spec_helper'

describe Ministry do
  before do
    @ministry = Factory.build(:ministry)
  end

  describe "validations" do
    describe "nama" do
      it "should have nama" do
        @ministry.nama = nil

        @ministry.should_not be_valid
      end

      it "should be unique" do
         @ministry.save

         @ministry2 = Factory.build(:ministry, nama: @ministry.nama)
         @ministry2.should_not be_valid
      end
    end
  end

  it "should default to aktif" do
    @ministry.is_aktif.should == true
  end
end
