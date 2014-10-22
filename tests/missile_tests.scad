use <testcard/testcard.scad>
use <missile/missile.scad>

echo(testTrue("Iterable", iterable([1, 2, 3])));
echo(testFalse("Not iterable", iterable(1)));

echo(testTrue("Empty", empty([])));
echo(testFalse("Not empty", empty([1, 2, 3])));

echo(testEqual("Head", head([1, 2, 3]), 1));

echo(testEqual("Tail some", tail([1, 2, 3]), [2, 3]));
echo(testEqual("Tail one", tail([1]), []));
echo(testEqual("Tail zero", tail([]), undef));

echo(testEqual("Last some", last([1, 2, 3]), 3));
echo(testEqual("Last one", last([1]), 1));
echo(testEqual("Last zero", last([]), undef));

echo(testEqual("Reverse some", reverse([1, 2, 3]), [3, 2, 1]));
echo(testEqual("Reverse zero", reverse([]), []));

echo(testTrue("Equal number", equal(0, 0), true));
echo(testFalse("Not equal number", equal(0, 5)));
echo(testTrue("Equal empty list", equal([], [])));
echo(testTrue("Equal list", equal([1, 2, 4], [1, 2, 4])));
echo(testFalse("Not equal list", equal([1, 2, 3], [1, 2, 4])));
echo(testTrue("Equal nested list", equal([[1, 2, 3], [4, 5, 6]],
                                         [[1, 2, 3], [4, 5, 6]])));
echo(testFalse("Not equal nested list", equal([[1, 2, 3], [4, 5, 6]],
                                              [[1, 2, 4], [4, 5, 6]])));
echo(testFalse("Equal unbalanced list", equal([[1, 2, 3], [4, 5, 6]],
                                              [7, [4, 5, 6]])));

echo(testTrue("All", all([true, true, true])));
echo(testFalse("Not all", all([true, true, false])));

echo(testTrue("Any", any([false, false, true])));
echo(testFalse("Not any", any([false, false, false])));

echo(testTrue("Contains", contains([1, 2, 3], 2)));
echo(testFalse("Doesn't contain", contains([1, 2, 3], 6)));

echo(testEqual("Zip zero", zip([]), []));
echo(testEqual("Zip zero 2", zip([[], [], []]), []));
echo(testEqual("Zip zero 3", zip([[], [1], [2]]), []));
echo(testEqual("Zip equal length",
               zip([[1, 2, 3], [4, 5, 6], [7, 8, 9]]),
                   [[1, 4, 7], [2, 5, 8], [3, 6, 9]]));
echo(testEqual("Zip different length",
               zip([[1, 2, 3], [4, 5], [7, 8, 9]]),
                   [[1, 4, 7], [2, 5, 8]]));

echo(testEqual("Sort zero", sort([]), []));
echo(testEqual("Sort some", sort([4, 2, 8, 16, 1]), [1, 2, 4, 8, 16]));

echo(testEqual("One Pole Filter Zero", onePoleFilter([], 0), []));
echo(testEqual("One Pole Filter Some", onePoleFilter([1, 2, 3], 0), [1, 2, 3]));
echo(testEqual("One Pole Filter Positive",
               onePoleFilter([4, 2, 5], 0.5), [4, 3, 4]));
echo(testEqual("One Pole Filter Negative",
               onePoleFilter([4, 2, 5], -0.5), [4, 1, 7]));


