(require '[clojure.java.io :as io])

;; part-01
(with-open [rdr (io/reader "input_01.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 suma-temp 0 lista-calorias []]
      (if (< idx num-rows)
        (if (not= line "")
          (recur (nth lines (inc idx)) (inc idx) (+ suma-temp (Integer/parseInt line)) lista-calorias)
          (recur (nth lines (inc idx)) (inc idx) 0 (conj lista-calorias suma-temp)))
        (println (reduce max (conj lista-calorias (+ suma-temp (Integer/parseInt line)))))))))


;; part-02
(with-open [rdr (io/reader "input_01.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 suma-temp 0 lista-calorias []]
      (if (< idx num-rows)
        (if (not= line "")
          (recur (nth lines (inc idx)) (inc idx) (+ suma-temp (Integer/parseInt line)) lista-calorias)
          (recur (nth lines (inc idx)) (inc idx) 0 (conj lista-calorias suma-temp)))
        (println (reduce + (subvec (vec (reverse (sort (conj lista-calorias (+ suma-temp (Integer/parseInt line)))))) 0 3)))))))