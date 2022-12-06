(require '[clojure.java.io :as io])

;; part-01
(with-open [rdr (io/reader "input_02.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 score 0 ]
      (if (< idx num-rows)
       (let [[oponent sol] (re-seq #"\w+" line)]
         (case sol 
           "X" (case oponent
                 "A" (recur (nth lines (inc idx)) (inc idx) (+ score 4))
                 "B" (recur (nth lines (inc idx)) (inc idx) (+ score 1))
                 "C" (recur (nth lines (inc idx)) (inc idx) (+ score 7)))
           "Y" (case oponent
                 "A" (recur (nth lines (inc idx)) (inc idx) (+ score 8))
                 "B" (recur (nth lines (inc idx)) (inc idx) (+ score 5))
                 "C" (recur (nth lines (inc idx)) (inc idx) (+ score 2)))
           "Z" (case oponent
                 "A" (recur (nth lines (inc idx)) (inc idx) (+ score 3))
                 "B" (recur (nth lines (inc idx)) (inc idx) (+ score 9))
                 "C" (recur (nth lines (inc idx)) (inc idx) (+ score 6)))))
        
        (let [[oponent sol] (re-seq #"\w+" line)]
          (println (case sol
                   "X" (case oponent
                         "A" (+ score 4)
                         "B" (+ score 1)
                         "C" (+ score 7))
                   "Y" (case oponent
                         "A" (+ score 8)
                         "B" (+ score 5)
                         "C" (+ score 2))
                   "Z" (case oponent
                         "A" (+ score 3)
                         "B" (+ score 9)
                         "C" (+ score 6)))))))))

;; part-02
(with-open [rdr (io/reader "input_02.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 score 0]
      (if (< idx num-rows)
        (let [[oponent sol] (re-seq #"\w+" line)]
          (case sol
            "X" (case oponent
                  "A" (recur (nth lines (inc idx)) (inc idx) (+ score 3))
                  "B" (recur (nth lines (inc idx)) (inc idx) (+ score 1))
                  "C" (recur (nth lines (inc idx)) (inc idx) (+ score 2)))
            "Y" (case oponent
                  "A" (recur (nth lines (inc idx)) (inc idx) (+ score 4))
                  "B" (recur (nth lines (inc idx)) (inc idx) (+ score 5))
                  "C" (recur (nth lines (inc idx)) (inc idx) (+ score 6)))
            "Z" (case oponent
                  "A" (recur (nth lines (inc idx)) (inc idx) (+ score 8))
                  "B" (recur (nth lines (inc idx)) (inc idx) (+ score 9))
                  "C" (recur (nth lines (inc idx)) (inc idx) (+ score 7)))))

        (let [[oponent sol] (re-seq #"\w+" line)]
          (println (case sol
                     "X" (case oponent
                           "A" (+ score 3)
                           "B" (+ score 1)
                           "C" (+ score 2))
                     "Y" (case oponent
                           "A" (+ score 4)
                           "B" (+ score 5)
                           "C" (+ score 6))
                     "Z" (case oponent
                           "A" (+ score 8)
                           "B" (+ score 9)
                           "C" (+ score 7)))))))))