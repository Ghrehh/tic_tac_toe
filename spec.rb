require "rubygems"
require "rspec"
require_relative "ttt.rb"

describe Player do
    before :each do
        @player = Player.new "Player 1", "x"
    end
    
    describe "valid player" do
        it "should return name" do
            expect(@player.name).to eq("Player 1")
        end

        it "should return sym" do
            expect(@player.sym).to eq("x")
        end
        
        it "should return an empty array" do
        	expect(@player.squares).to eq([])
        end
    end
end