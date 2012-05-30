require "spec_helper"
require 'prime_iterator'

describe "Test" do
  it "should get first four prime numbers starting with 2" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
  end

  it "should get first ten prime numbers starting with 2" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
    iterator.next.should eql 11
    iterator.next.should eql 13
    iterator.next.should eql 17
    iterator.next.should eql 19
    iterator.next.should eql 23
    iterator.next.should eql 29
  end

  it "should get eleven prime numbers starting with 2" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
    iterator.next.should eql 11
    iterator.next.should eql 13
    iterator.next.should eql 17
    iterator.next.should eql 19
    iterator.next.should eql 23
    iterator.next.should eql 29

    # should get next batch of prime numbers here
    iterator.next.should eql 31
  end

  it "should reset and restart prime number sequence from 2" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7

    iterator.reset
    iterator.next.should eql 2
  end

  it "should get previous four prime numbers" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
    iterator.previous.should eql 5
    iterator.previous.should eql 3
    iterator.previous.should eql 2

    # previous at 2 will always return nil
    iterator.previous.should eql nil
  end

  it "should get previous ten prime numbers when previous is called on eleventh prime" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
    iterator.next.should eql 11
    iterator.next.should eql 13
    iterator.next.should eql 17
    iterator.next.should eql 19
    iterator.next.should eql 23
    iterator.next.should eql 29

    # should get next batch of prime numbers here
    iterator.next.should eql 31

    # should get previous batch here
    iterator.previous.should eql 29
    iterator.previous.should eql 23
    iterator.previous.should eql 19
    iterator.previous.should eql 17
    iterator.previous.should eql 13
    iterator.previous.should eql 11
    iterator.previous.should eql 7
    iterator.previous.should eql 5
    iterator.previous.should eql 3
    iterator.previous.should eql 2
    iterator.previous.should eql nil
  end

  it "should get next 10 then previous 10 then next 10 again" do
    iterator = PrimeIterator.new
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
    iterator.next.should eql 11
    iterator.next.should eql 13
    iterator.next.should eql 17
    iterator.next.should eql 19
    iterator.next.should eql 23
    iterator.next.should eql 29

    # should get next batch of prime numbers here
    iterator.next.should eql 31

    # should get previous batch here
    iterator.previous.should eql 29
    iterator.previous.should eql 23
    iterator.previous.should eql 19
    iterator.previous.should eql 17
    iterator.previous.should eql 13
    iterator.previous.should eql 11
    iterator.previous.should eql 7
    iterator.previous.should eql 5
    iterator.previous.should eql 3
    iterator.previous.should eql 2
    iterator.previous.should eql nil

    # should get next batch here
    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7
    iterator.next.should eql 11
    iterator.next.should eql 13
    iterator.next.should eql 17
    iterator.next.should eql 19
    iterator.next.should eql 23
    iterator.next.should eql 29

    # should get next batch of prime numbers here
    iterator.next.should eql 31
  end

  it "should get prime numbers unique to the instance" do
    iterator = PrimeIterator.new
    iterator2 = PrimeIterator.new

    iterator.next.should eql 2
    iterator.next.should eql 3
    iterator.next.should eql 5
    iterator.next.should eql 7

    # second instance should return 2
    iterator2.next.should eql 2
  end

  it "should return nil if previous is called on newly instantiated iterator" do
    iterator = PrimeIterator.new
    iterator.previous.should eql nil
  end

end