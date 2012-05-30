#
# Provides API to get next and previous prime number
#
# USAGE:
#    iterator = PrimeIterator.new
#    iterator.next        # get next prime number, starting from 2
#    iterator.previous    # get previous prime number, or nil if previous is called on prime number 2
#    iterator.reset       # resets, next will start at 2
#    iterator.batch_size= # sets the number of prime numbers gotten per fetch (which occurs when previous is called at top of list or next is called at end of list)
#
require 'prime_finder'

class PrimeIterator

  attr_accessor :batch_size

  #
  # Init
  #
  def initialize
    @batch_size = 10 # default size is 10
    @current_lower_bound = 2  # 2 is first prime number
    @current_upper_bound = 2  #
    @current_prime_list = Array.new
    @current_prime_list_idx = -1
  end

  #
  # Get next prime number
  #
  def next
    # if list is empty or index is pointing to end of list, get next batch of prime numbers
    if @current_prime_list.empty? || @current_prime_list_idx == @batch_size-1
      get_next_batch_of_primes
    end

    @current_prime_list_idx += 1
    @current_prime_list[@current_prime_list_idx]
  end

  #
  # Get previous prime number
  #
  def previous
    return nil if @current_prime_list.empty?

    # if at top of list, then get previous batch of prime numbers
    if @current_prime_list_idx == 0
      get_prev_batch_of_primes
      @current_prime_list_idx = @batch_size - 1 # 0 based index
    else
      @current_prime_list_idx -= 1
    end

    @current_prime_list[@current_prime_list_idx] unless @current_prime_list.empty? # could be empty if previous is called on prime number 2
  end

  #
  # Reset
  #
  def reset
    initialize
  end

  private #####

  #
  # Get next batch of prime numbers
  #
  def get_next_batch_of_primes
    @current_prime_list.clear

    # keep getting prime numbers until batch size is reached
    begin
      finder = PrimeFinder.new
      @current_prime_list = finder.find_primes @current_lower_bound, @current_upper_bound
      @current_upper_bound += 1
    end until @current_prime_list.size == @batch_size

    @current_lower_bound = @current_upper_bound
    @current_prime_list_idx = -1 # set to before top of list
  end

  #
  # Get previous batch of prime numbers
  #
  def get_prev_batch_of_primes
    @current_upper_bound = @current_prime_list[0] - 1 # minus 1 so it doesn't include the current prime number
    @current_prime_list.clear

    finder = PrimeFinder.new
    previous_prime_batch = finder.find_primes @current_upper_bound
    @current_prime_list = previous_prime_batch.last(@batch_size)  # truncate the list to the last BATCH_SIZE number of prime numbers

    if @current_prime_list.empty?
      # keep previous lower bound
      # set upper bound equal to lower bound
      @current_upper_bound = @current_lower_bound
    else
      # otherwise, set the lower bound to be the first prime number in this batch
      @current_lower_bound = previous_prime_batch.first
    end
  end

end