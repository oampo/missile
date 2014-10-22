# Missile - Utility functions for OpenSCAD

## Installation

To install Missile create a clone of this repository in your OpenSCAD path.

## API Documentation

```
function iterable(value)
```

Tests whether an object is iterable.  Returns `true` for iterable objects, and `false` for non-iterable objects.

```
function empty(vec)
```

Tests whether a vector is empty.  Returns true if the vector is of zero length, and false otherwise.

```
function vector(range)
```

Converts a range into a vector.

```
function head(vec)
```

Returns the first element of a vector.  If the vector is empty, returns `undef`.

```
function tail(vec)
```

Returns a vector containing all except the first element of a vector.  If the vector is empty, returns `undef`.

```
function last(vec)
```

Returns the last element of a vector.  If the vector is empty, returns `undef`.

```
function reverse(vec)
```

Reverses a vector.

```
function equal(valueA, valueB)
```

An equality function.  Differs from `==` in that it will also recursively compare vectors to ensure that each element is equal.

```
function all(vec)
```

Returns true if all elements of a vector are true, and false otherwise.

```
function any(vec)
```

Returns true if any element of a vector is true, and false otherwise.

```
function contains(vec, value)
```

Returns true if any of the elements of a vector are equal to a value.  Uses the `equal` function to determine equality.

```
function zip(vecs)
```

Returns a vector of vectors, where the i-th vector contains the i-th element from each of the input vectors.  For example: `zip([[1, 2, 3], [4, 5, 6]])` returns `[[1, 4], [2, 5], [3, 6]]`.

```
function sort(vec)
```

Sorts a vector in ascending order using the quicksort algorithm.

```
function onePoleFilter(vec, coeff)
```

Filters a vector of values.  A coefficient between 0 and 1 will act as a low-pass filter.  A coefficient between -1 and 0 will act as a high-pass filter.

## Testing

In order to run Missile's test suite your will need [Test Card](https://github.com/oampo/testcard) installed.  Then run the `tests/missile_tests.scad` file in OpenSCAD, and check the console output.

## License

Missile is licensed under the terms of the MIT license.
