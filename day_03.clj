(require '[clojure.java.io :as io])

(def letras 
  ["a" ,"b" ,"c" ,"d" , "e", "f", "g" , "h", "i" ,"j" , "k" , "l" , "m", "n", "o", "p", "q" , "r", "s", "t" , "u", "v", "w", "x", "y" , "z"])
(def hash-letras 
  (loop [hash-temp {} idx 0]
    (if (< idx (* (count letras) 2))
      (if (< idx (count letras))
        (recur (assoc hash-temp (keyword (nth letras idx)) (inc idx)) (inc idx))
        (recur (assoc hash-temp (keyword (clojure.string/upper-case (nth letras (- idx 26)))) (inc idx)) (inc idx)))
      hash-temp)))


;; part-01
(with-open [rdr (io/reader "resources/input_03.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 prioridades []]
      (if (< idx num-rows)
        (let [[rucksack] (re-seq #"\w+" line)
              largo (count rucksack)
              mitad (/ largo 2)
              subs1 (subs rucksack 0 mitad)
              subs2 (subs rucksack mitad)]
          (recur (nth lines (inc idx)) (inc idx) (conj prioridades (get hash-letras (keyword (first (clojure.set/intersection (set (map str (set subs1))) (set (map str (set subs2))))))))))
        (let [[rucksack] (re-seq #"\w+" line)
              largo (count rucksack)
              mitad (/ largo 2)
              subs1 (subs rucksack 0 mitad)
              subs2 (subs rucksack mitad)]
          (reduce + (conj prioridades (get hash-letras (keyword (first (clojure.set/intersection (set (map str (set subs1))) (set (map str (set subs2))))))))))))))

;; part-02
(with-open [rdr (io/reader "resources/input_03.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 group [] prioridades []]
      (if (< idx num-rows)
        (if (< (count group) 3)
          (let [[rucksack] (re-seq #"\w+" line)]
            (recur (nth lines (inc idx)) (inc idx) (conj group (set (map str (set rucksack)))) prioridades))
          (let [[rucksack] (re-seq #"\w+" line)]
            (recur (nth lines (inc idx)) (inc idx) (conj [] (set (map str (set rucksack)))) (conj prioridades (get hash-letras (keyword (first (apply clojure.set/intersection group))))))))
        (let [[rucksack] (re-seq #"\w+" line)]
          (reduce + (conj prioridades (get hash-letras (keyword (first (apply clojure.set/intersection (conj group (set (map str (set rucksack)))))))))))))))