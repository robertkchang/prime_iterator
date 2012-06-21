#
# Provides API to get next and previous prime number
#
# USAGE:
#    iterator = PrimeIterator.new <starting_prime>
#    iterator.next            # get next prime number, starting from <starting_prime>; defaults to 2 if <starting_prime> is not given
#    iterator.previous        # get previous prime number, or nil if previous is called on prime number 2
#    iterator.reset           # resets, next will start at <starting_prime>
#    iterator.batch_size=     # sets the number of prime numbers gotten per fetch (which occurs when previous is called at top of list or next is called at end of list)
#    iterator.starting_prime= # sets the starting prime.  Must call PrimeIterator.reset to take effect.
#
#
require 'prime_finder'

class PrimeIterator

  DEFAULT_LOWER_BOUND = 2 # 2 is first prime number
  DEFAULT_BATCH_SIZE = 10

  attr_accessor :batch_size, :starting_prime

  #
  # Init
  #
  def initialize *args

    @starting_prime = DEFAULT_LOWER_BOUND
    if args.size > 1
      raise "Invalid number of parameter. Specify a starting prime number or do not specify to start at 2."
    elsif args.size == 1
      @starting_prime = args[0]
    end

    # is given lower bound a valid prime number?
    finder = PrimeFinder.new
    prime_arr = finder.find_primes @starting_prime, @starting_prime
    if prime_arr.size==0
      raise "#{@starting_prime} is an invalid starting prime number."
    end

    @batch_size = DEFAULT_BATCH_SIZE
    @current_lower_bound = @starting_prime
    @current_upper_bound = @starting_prime
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
    initialize @starting_prime
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