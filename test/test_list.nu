;; test_list.nu
;;  tests for basic Nu list operations.
;;
;;  Copyright (c) 2007 Tim Burks, Neon Design Technology, Inc.

(class TestList is NuTestCase

     (- testCompare is
        (assert_equal t (eq '(1 2 3) '(1 2 3)))
        (assert_equal t (eq '(1 (2 3)) '(1 (2 3))))
        (assert_equal nil (eq '(1 2 3) '(1 2)))
        (assert_equal nil (eq '(1 2) '(1 2 3)))
        (assert_equal nil (eq '(1 2 3) nil))
        (assert_equal nil (eq '(1 2 3) 2))
        (assert_equal nil (eq 2 '(1 2 3)))
        (assert_equal nil (eq nil '(1 2 3)))
        (assert_equal t (eq '(a b c) '(a b c)))
        (assert_equal nil (eq '(a b c) '(a b d)))
        (assert_equal nil (eq '(i) '(j)))
        (assert_equal t (eq 'i 'i))
        (assert_equal nil (eq 'i 'j)))

     (- testObjectAtIndex is
        (assert_equal 1 ('(1 2 3) objectAtIndex:0))
        (assert_equal 2 ('(1 2 3) objectAtIndex:1))
        (assert_equal 3 ('(1 2 3) objectAtIndex:2))
        (assert_equal nil ('(1 2 3) objectAtIndex:3)))

     (- testBasicOperators is
        (assert_equal 1 (car '(1 2 3)))
        (assert_equal '(2 3) (cdr '(1 2 3)))
        (assert_equal 1 (first '(1 2 3)))
        (assert_equal '(2 3) (rest '(1 2 3)))
        (assert_equal 1 (head '(1 2 3)))
        (assert_equal '(2 3) (tail '(1 2 3))))

     (- testIndexing is
        (set mylist '(1 2 3))
        (assert_equal 1 (mylist 0))
        (assert_equal 2 (mylist 1))
        (assert_equal 3 (mylist (+ 1 1)))
        (assert_equal 3 (mylist -1))
        (assert_equal 2 (mylist -2))
        (assert_equal 1 (mylist -3))
        (assert_equal nil (mylist 3))
        (assert_equal nil (mylist -4)))

     (- testLength is
        (set mylist '(1 2 3 4))
        (assert_equal 4 (mylist length))
        (assert_equal 4 (mylist count))
        (set mylist nil)
        (assert_equal 0 (mylist length))
        (assert_equal 0 (mylist count)))

     (- testAll is
        (assert_equal t (all '()))
        (assert_equal nil (all (list nil)))
        (assert_equal nil (all (list 1 nil)))
        (assert_equal t (all (list 3 2 1)))
        (assert_equal nil (all (list '(3) nil))))

     (- testAny is
        (assert_equal nil (any '()))
        (assert_equal nil (any (list nil)))
        (assert_equal 1 (any (list 1 nil)))
        (assert_equal 1 (any (list nil 1)))
        (assert_equal 3 (any (list 3 2 1))))

     (- testApply is
        (assert_equal 1 (apply + '(1)))
        (assert_equal 3 (apply + '(1 2))))

     (- testMap is
        (assert_equal '()     (map + '()))
        (assert_equal '()     (map + '() '()))
        (assert_equal '()     (map + '(1) '()))
        (assert_equal '()     (map + '() '(1)))
        (assert_equal '(3)    (map + '(1) '(2)))
        (assert_equal '(9 12) (map + '(1 2) '(3 4) '(5 6)))
        (assert_equal '(9)    (map + '(1 2) '(3) '(5 6)))))

