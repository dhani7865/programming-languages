(println "Hello")
(str "12 square is "
(* 12 12))

(defn square [num] (* num num))
(square 12)

(defn fact [x] (reduce *(range 2 (inc x))))
(fact 5)

(defn predict-balance [initial interestRate years](* initial (Math/pow (inc interestRate) years)))
(predict-balance 300 0.005 10)

(defn get-divisors [n] (range  2 (Math/round (inc (Math/sqrt n)))))

(get-divisors 4)
(get-divisors 101)

(defn divides? [x n]
 (true?
(= 0 (mod n x))
)
)
(divides? 2 10)
(divides? 4 10)

(defn nodivisors [n]
(def list (get-divisors n))
(not-any? #((fn [x] (divides? x n))%)list)
)
(nodivisors 9)
(nodivisors 7)
(defn is-prime? [n]
  (if (= n 2)
    true
    (if (= n 1)
      false
      (nodivisors n)
    )
  )
)
 
 (is-prime? 1)
 (is-prime? 2)
 (is-prime? 3)
 (is-prime? 4)
 (is-prime? 101)
  

(defn prime-seq [n1 n2]
(def list (range n1 (inc n2))
)
(filter #((fn [x] (is-prime? x))%)list))

(prime-seq 50 100)
(prime-seq 7 11)

(defn print-top-primes [n1 n2]
(def list (take 10 (reverse (prime-seq n1  n2 ))))

(doseq [x list] (println x)) 
(reduce + list)
)

(print-top-primes 50 100)

(print-top-primes 7 11)


