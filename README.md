Prime Iterator

Provides API to get next and previous prime number.

USAGE:
<p> Provides API to get next and previous prime number
<p>
<p> USAGE:
<p>    iterator = PrimeIterator.new <starting_prime>
<p>    iterator.next            # get next prime number, starting from <starting_prime>; defaults to 2 if <starting_prime> is not given
<p>    iterator.previous        # get previous prime number, or nil if previous is called on prime number 2
<p>    iterator.reset           # resets, next will start at <starting_prime>
<p>    iterator.batch_size=     # sets the number of prime numbers gotten per fetch (which occurs when previous is called at top of list or next is called at end of list)
<p>    iterator.starting_prime= # sets the starting prime.  Must call PrimeIterator.reset to take effect.
