require 'rails_helper'

RSpec.describe Event, :type => :model do

  describe ".venue" do
    before do
      @event = Event.new( :name => "Test" )
    end

    it "should return classroom if capacity < 100" do
      @event.capacity = 10

      expect( @event.venue ).to eq("classroom")
    end

   it "should return hall if capacity >= 100" do
      @event.capacity = 100

      expect( @event.venue ).to eq("hall")
    end

  end

end
