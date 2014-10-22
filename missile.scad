function iterable(value) =
    (len(value) != undef);

function empty(vec) =
    (len(vec) == 0);

function vector(range) = [for (i=range) i];

function head(vec) =
    vec[0];

function tail(vec) =
    empty(vec) ? undef :
    len(vec) == 1 ? [] :
    [for (i = [1 : len(vec) - 1]) vec[i]];

function last(vec) =
    empty(vec) ? undef :
    len(vec) == 1 ? vec[0] :
    last(tail(vec));

function reverse(vec) =
    empty(vec) ? [] :
    concat(reverse(tail(vec)), head(vec));

function equal(valueA, valueB) =
    // valueA is iterable, but valueB isn't
    (!iterable(valueA) && iterable(valueB)) ? false :
    // valueB is iterable, but valueA isn't
    (iterable(valueA) && !iterable(valueB)) ? false :
    // Neither are iterable, so compare using ==
    (!iterable(valueA) && !iterable(valueB)) ? (valueA == valueB) :
    // Both iterables
    (empty(valueA) && empty(valueB)) ? true :
    // Both iterables are a different length
    (empty(valueA) || empty(valueB)) ? false :
    // If first values are different return false
    (!equal(head(valueA), head(valueB))) ? false :
    // Else check the remaining elements
    equal(tail(valueA), tail(valueB));

function all(vec) =
    (len(vec) == 0) ? true :
    (!head(vec)) ? false:
    all(tail(vec));

function any(vec) =
    (len(vec) == 0) ? false :
    head(vec) ? true :
    any(tail(vec));

function contains(vec, value) =
    (len(vec) == 0) ? false :
    equal(head(vec), value) ? true :
    contains(tail(vec), value);

function zip(vecs) =
    len(vecs) == 0 ? [] :
    (min([for (i=vecs) len(i)]) == 0) ? [] :
    let(
        remainder = [for (i=[0:len(vecs) - 1]) tail(vecs[i])],
        value = [for (i=[0:len(vecs) - 1]) head(vecs[i])]
    )
    concat([value], zip(remainder));

function sort(vec) =
    empty(vec) ? [] :
    let(
        pivot = vec[floor(len(vec)/2)],
        below = [for (y = vec) if (y  < pivot) y],
        equal = [for (y = vec) if (y == pivot) y],
        above = [for (y = vec) if (y  > pivot) y]
    )
    concat(sort(below), equal, sort(above));

function onePoleFilter(vec, coeff, prev=undef) =
    empty(vec) ? [] :
    (prev == undef) ? onePoleFilter(vec, coeff, head(vec)) :
    let(
        next = head(vec) * (1 - coeff) + prev * coeff,
        remainder = tail(vec)
    )
    concat(next, onePoleFilter(remainder, coeff, next));

