require "spec_helper"
require 'prime_iterator'

describe "Test" do
  it "should get first four prime numbers starting with 2" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7
  end

  it "should get first ten prime numbers starting with 2" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    next_prime = iterator.next
    next_prime.should eql 11

    next_prime = iterator.next
    next_prime.should eql 13

    next_prime = iterator.next
    next_prime.should eql 17

    next_prime = iterator.next
    next_prime.should eql 19

    next_prime = iterator.next
    next_prime.should eql 23

    next_prime = iterator.next
    next_prime.should eql 29
  end

  it "should get eleven prime numbers starting with 2" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    next_prime = iterator.next
    next_prime.should eql 11

    next_prime = iterator.next
    next_prime.should eql 13

    next_prime = iterator.next
    next_prime.should eql 17

    next_prime = iterator.next
    next_prime.should eql 19

    next_prime = iterator.next
    next_prime.should eql 23

    next_prime = iterator.next
    next_prime.should eql 29

    # should get next batch of prime numbers here

    next_prime = iterator.next
    next_prime.should eql 31
  end

  it "should reset and restart prime number sequence from 2" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    iterator.reset

    next_prime = iterator.next
    next_prime.should eql 2
  end

  it "should get previous four prime numbers" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    prev_prime = iterator.previous
    prev_prime.should eql 5

    prev_prime = iterator.previous
    prev_prime.should eql 3

    prev_prime = iterator.previous
    prev_prime.should eql 2

    # previous at 2 will always return nil

    prev_prime = iterator.previous
    prev_prime.should eql nil
  end

  it "should get previous ten prime numbers when previous is called on eleventh prime" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    next_prime = iterator.next
    next_prime.should eql 11

    next_prime = iterator.next
    next_prime.should eql 13

    next_prime = iterator.next
    next_prime.should eql 17

    next_prime = iterator.next
    next_prime.should eql 19

    next_prime = iterator.next
    next_prime.should eql 23

    next_prime = iterator.next
    next_prime.should eql 29

    # should get next batch of prime numbers here

    next_prime = iterator.next
    next_prime.should eql 31

    # should get previous batch here

    prev_prime = iterator.previous
    prev_prime.should eql 29

    prev_prime = iterator.previous
    prev_prime.should eql 23

    prev_prime = iterator.previous
    prev_prime.should eql 19

    prev_prime = iterator.previous
    prev_prime.should eql 17

    prev_prime = iterator.previous
    prev_prime.should eql 13

    prev_prime = iterator.previous
    prev_prime.should eql 11

    prev_prime = iterator.previous
    prev_prime.should eql 7

    prev_prime = iterator.previous
    prev_prime.should eql 5

    prev_prime = iterator.previous
    prev_prime.should eql 3

    prev_prime = iterator.previous
    prev_prime.should eql 2

    prev_prime = iterator.previous
    prev_prime.should eql nil
  end

  it "should get next 10 then previous 10 then next 10 again" do
    iterator = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    next_prime = iterator.next
    next_prime.should eql 11

    next_prime = iterator.next
    next_prime.should eql 13

    next_prime = iterator.next
    next_prime.should eql 17

    next_prime = iterator.next
    next_prime.should eql 19

    next_prime = iterator.next
    next_prime.should eql 23

    next_prime = iterator.next
    next_prime.should eql 29

    # should get next batch of prime numbers here

    next_prime = iterator.next
    next_prime.should eql 31

    # should get previous batch here

    prev_prime = iterator.previous
    prev_prime.should eql 29

    prev_prime = iterator.previous
    prev_prime.should eql 23

    prev_prime = iterator.previous
    prev_prime.should eql 19

    prev_prime = iterator.previous
    prev_prime.should eql 17

    prev_prime = iterator.previous
    prev_prime.should eql 13

    prev_prime = iterator.previous
    prev_prime.should eql 11

    prev_prime = iterator.previous
    prev_prime.should eql 7

    prev_prime = iterator.previous
    prev_prime.should eql 5

    prev_prime = iterator.previous
    prev_prime.should eql 3

    prev_prime = iterator.previous
    prev_prime.should eql 2

    prev_prime = iterator.previous
    prev_prime.should eql nil

    # should get next batch here

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    next_prime = iterator.next
    next_prime.should eql 11

    next_prime = iterator.next
    next_prime.should eql 13

    next_prime = iterator.next
    next_prime.should eql 17

    next_prime = iterator.next
    next_prime.should eql 19

    next_prime = iterator.next
    next_prime.should eql 23

    next_prime = iterator.next
    next_prime.should eql 29

    # should get next batch of prime numbers here

    next_prime = iterator.next
    next_prime.should eql 31
  end

  it "should get prime numbers unique to the instance" do
    iterator = PrimeIterator.new
    iterator2 = PrimeIterator.new

    next_prime = iterator.next
    next_prime.should eql 2

    next_prime = iterator.next
    next_prime.should eql 3

    next_prime = iterator.next
    next_prime.should eql 5

    next_prime = iterator.next
    next_prime.should eql 7

    # second instance should return 2
    next_prime2 = iterator2.next
    next_prime2.should eql 2
  end

end