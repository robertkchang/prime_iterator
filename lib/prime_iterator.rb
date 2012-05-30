#
# Provides API to get next and previous prime number
#
require 'prime_finder'

class PrimeIterator

  BATCH_SIZE = 10

  def initialize
    @current_lower_bound = 2  # 2 is first prime number
    @current_upper_bound = 2  #
    @current_prime_list = Array.new
    @current_prime_list_idx = -1
  end

  def next
    # if list is empty or index is pointing to end of list, get next batch of prime numbers
    if @current_prime_list.empty? || @current_prime_list_idx == BATCH_SIZE-1
      get_next_batch_of_primes
    end

    @current_prime_list_idx += 1
    @current_prime_list[@current_prime_list_idx]
  end

  def previous
    return nil if @current_prime_list.empty?

    # if at top of list, then get previous batch of prime numbers
    if @current_prime_list_idx == 0
      get_prev_batch_of_primes
      @current_prime_list_idx = BATCH_SIZE - 1 # 0 based index
    else
      @current_prime_list_idx -= 1
    end

    @current_prime_list[@current_prime_list_idx] unless @current_prime_list.empty? # could be empty if previous is called on prime number 2
  end

  def reset
    initialize
  end

  private #####

  def get_next_batch_of_primes
    @current_prime_list.clear

    # keep getting prime numbers until batch size is reached
    begin
      finder = PrimeFinder.new
      @current_prime_list = finder.find_primes @current_lower_bound, @current_upper_bound
      @current_upper_bound += 1
    end until @current_prime_list.size == BATCH_SIZE

    @current_lower_bound = @current_upper_bound
    @current_prime_list_idx = -1 # set to before top of list
  end

  def get_prev_batch_of_primes
    @current_upper_bound = @current_prime_list[0] - 1 # minus 1 so it doesn't include the current prime number
    @current_prime_list.clear

    finder = PrimeFinder.new
    previous_prime_batch = finder.find_primes @current_upper_bound
    @current_prime_list = previous_prime_batch.last(BATCH_SIZE)  # truncate the list to the last BATCH_SIZE number of prime numbers

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