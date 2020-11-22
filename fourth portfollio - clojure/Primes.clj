;; get-divisors function has been created which takes a number n as input and returns  all the numbers between 2 and √𝑛 inclusive
(defn get-divisors [n] (range  2 (Math/round (inc (Math/sqrt n)))))

;; Get devisors for 4, 101
(get-divisors 4)
(get-divisors 101)

;; Creating function for  divides? which take a input for divisor x and a number n.  The function then returns true if x divides n and false otherwise.
(defn divides? [x n]
 (true?
(= 0 (mod n x))
)
)
;; This will return true, otherwise returning false
(divides? 2 10)
(divides? 4 10)

;;  Creating no-divisors? function which takes an input n.  The function  returns true if none of the numbers between 2 and √𝑛 divide n, and false otherwise.  The function then uses both get-divisors function and the divides? function. 
(defn nodivisors [n]
(def list (get-divisors n))
(not-any? #((fn [x] (divides? x n))%)list)
)
;; This will return false and 7 will return true
(nodivisors 9)
(nodivisors 7)

;; Creating is-prime? function which takes an input n and returns true if n is prime, and false otherwise.  This function then checks to see if n is 1 or 2 and responds accordingly; if it's not, it then calls the no-divisors? function.function. 
(defn is-prime? [n]
  (if (= n 2)
    true
    (if (= n 1)
      false
      (nodivisors n)
    )
  )
)
 ;; this will return false, true, true, false and true
 (is-prime? 1)
 (is-prime? 2)
 (is-prime? 3)
 (is-prime? 4)
 (is-prime? 101)
  
;; Creating function prime-seq which takes inputs from and to.  The function returns all the prime numbers between from and to inclusive. 
(defn prime-seq [n1 n2]
(def list (range n1 (inc n2))
)
(filter #((fn [x] (is-prime? x))%)list))

;; Returning all prime numbers between 50 and 100.
(prime-seq 50 100)
(prime-seq 7 11)

;; Creating function for print-top-primes which takes inputs from and to.  This function displays the 10 largest primes in the range from and to inclusive, which have been obtained from the prime-seq function.  It then prints out the sum of the 10 largest primes

;; Total number which will be outputted is, 732 and 18.
(defn print-top-primes [n1 n2]
(def list (take 10 (reverse (prime-seq n1  n2 ))))

;; do sequence
(doseq [x list] (println x)) 
(reduce + list)
)

;; printing the top primes of 50 and 100
(print-top-primes 50 100)

;; printing the top primes of 7 and 11
(print-top-primes 7 11)

