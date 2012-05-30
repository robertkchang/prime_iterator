#
# Provides API to get next and previous prime number
#
require 'prime_finder'

class PrimeIterator

  BATCH_SIZE = 10

  def initialize
    @current_lower_bound = 2  # init to 2
    @current_upper_bound = 2  # init to 2
    @current_prime_batch = Array.new
    @current_prime_batch_idx = 0
  end

  def next
    if @current_prime_batch.empty? || @current_prime_batch_idx == BATCH_SIZE-1
      get_next_batch_of_primes
    end

    @current_prime_batch_idx += 1
    @current_prime_batch[@current_prime_batch_idx]
  end

  def previous
    if @current_prime_batch.empty?
      return nil
    end

    if @current_prime_batch_idx == 0
      get_prev_batch_of_primes
      @current_prime_batch_idx = BATCH_SIZE - 1
    else
      @current_prime_batch_idx -= 1
    end

    @current_prime_batch[@current_prime_batch_idx]
  end

  def reset
    initialize
  end

  private #####

  def get_next_batch_of_primes
    @current_prime_batch.clear

    # keep getting prime numbers until batch size is reached
    begin
      finder = PrimeFinder.new
      @current_prime_batch = finder.find_primes @current_lower_bound, @current_upper_bound
      @current_upper_bound += 1
    end until @current_prime_batch.size == BATCH_SIZE

    @current_lower_bound = @current_upper_bound
    @current_prime_batch_idx = -1
  end

  def get_prev_batch_of_primes
    @current_upper_bound = @current_prime_batch[0] - 1 # minus 1 so it doesn't include the current prime number
    @current_prime_batch.clear

    finder = PrimeFinder.new
    previous_prime_batch = finder.find_primes @current_upper_bound
    @current_prime_batch = previous_prime_batch.last(BATCH_SIZE)  # truncate the list to the last BATCH_SIZE number of prime numbers

    if @current_prime_batch.empty?
      # keep previous lower bound
      # set upper bound equal to lower bound
      @current_upper_bound = @current_lower_bound
    else
      # otherwise, set the lower bound to be the first prime numbner in this batch
      @current_lower_bound = previous_prime_batch.first
    end
  end

end