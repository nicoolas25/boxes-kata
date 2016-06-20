# Boxes *kata*

This question was found on StackOverflow. I wanted an algorithmic problem
to teach what programming could be. There is a few ways to solve it here.

### Problem

There are given n boxes, each one has fixed weight and strength (both given in kg).
Box's strength tells us what is the maximum weight it can bear. We have to form the
highest pile of given boxes (each of them has the same height).

You should propose an algorithm that will always give an optimal solution,
which is the longest sequence of k boxes (k <= n).

### Bruteforce

It is what `PileExplorer` in the `test_helpers.rb` file is about.
It tries every state of the problem blindly, keep the valid states,
and find the solution looking at all the valid states.

### Heuristic

Trying to show an alternative to the bruteforce (which is very long) by mimicing
and human brain. Also this show how to use recursion. The point is, there is no
warranty that the result would be the best solution...

### Smarter bruteforce

In the `Explorer` class, there is a new algorithm that does a smarter
`partition` and only build possible piles.
