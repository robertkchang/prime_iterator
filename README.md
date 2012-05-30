Prime Iterator

Provides API to get next and previous prime number.

USAGE:
       iterator = PrimeIterator.new
       iterator.next        # get next prime number, starting from 2
       iterator.previous    # get previous prime number, or nil if previous is called on prime number 2
       iterator.reset       # resets, next will start at 2
       iterator.batch_size= # sets the number of prime numbers gotten per fetch (which occurs when previous is called at top of list or next is called at end of list)
