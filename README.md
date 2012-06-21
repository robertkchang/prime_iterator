<h1>Prime Iterator</h1>

Provides API to get next and previous prime number.

<p><b>USAGE:</b>
<p>    iterator = PrimeIterator.new &lt;starting_prime&gt;
<br>   iterator.next            # get next prime number, starting from <starting_prime>; defaults to 2 if &lt;starting_prime&gt; is not given
<br>   iterator.previous        # get previous prime number, or nil if previous is called on prime number 2
<br>   iterator.reset           # resets, next will start at &lt;starting_prime&gt;
<br>   iterator.batch_size=     # sets the number of prime numbers gotten per fetch (which occurs when previous is called at top of list or next is called at end of list)
<br>   iterator.starting_prime= # sets the starting prime.  Must call PrimeIterator.reset to take effect.
