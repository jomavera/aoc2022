;; part-01
(with-open [rdr (io/reader "input_04.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 count-subsets 0]
      (if (< idx num-rows)
        (let [[range1 range2] (re-seq #"\w+-\w+" line)
              [lb1_str ub1_str] (clojure.string/split range1 #"\-")
              lb1 (Integer/parseInt lb1_str)
              ub1 (Integer/parseInt ub1_str)
              [lb2_str ub2_str] (clojure.string/split range2 #"\-")
              lb2 (Integer/parseInt lb2_str)
              ub2 (Integer/parseInt ub2_str)]
          (if (or (clojure.set/subset? (set (range lb1 (inc ub1))) (set (range lb2 (inc ub2)))) (clojure.set/subset? (set (range lb2 (inc ub2))) (set (range lb1 (inc ub1)))))
            (recur (nth lines (inc idx)) (inc idx) (inc count-subsets))
            (recur (nth lines (inc idx)) (inc idx) count-subsets)))
        (let [[range1 range2] (re-seq #"\w+-\w+" line)
              [lb1_str ub1_str] (clojure.string/split range1 #"\-")
              lb1 (Integer/parseInt lb1_str)
              ub1 (Integer/parseInt ub1_str)
              [lb2_str ub2_str] (clojure.string/split range2 #"\-")
              lb2 (Integer/parseInt lb2_str)
              ub2 (Integer/parseInt ub2_str)]
          (if (or (clojure.set/subset? (set (range lb1 (inc ub1))) (set (range lb2 (inc ub2)))) (clojure.set/subset? (set (range lb2 (inc ub2))) (set (range lb1 (inc ub1)))))
            (println (inc count-subsets))
            (println count-subsets)))))))

;; part-02
(with-open [rdr (io/reader "input_04.txt")]
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0 count-subsets 0]
      (if (< idx num-rows)
        (let [[range1 range2] (re-seq #"\w+-\w+" line)
              [lb1_str ub1_str] (clojure.string/split range1 #"\-")
              lb1 (Integer/parseInt lb1_str)
              ub1 (Integer/parseInt ub1_str)
              [lb2_str ub2_str] (clojure.string/split range2 #"\-")
              lb2 (Integer/parseInt lb2_str)
              ub2 (Integer/parseInt ub2_str)]
          (if (> (count (clojure.set/intersection (set (range lb1 (inc ub1))) (set (range lb2 (inc ub2))))) 0)
            (recur (nth lines (inc idx)) (inc idx) (inc count-subsets))
            (recur (nth lines (inc idx)) (inc idx) count-subsets)))
        (let [[range1 range2] (re-seq #"\w+-\w+" line)
              [lb1_str ub1_str] (clojure.string/split range1 #"\-")
              lb1 (Integer/parseInt lb1_str)
              ub1 (Integer/parseInt ub1_str)
              [lb2_str ub2_str] (clojure.string/split range2 #"\-")
              lb2 (Integer/parseInt lb2_str)
              ub2 (Integer/parseInt ub2_str)]
          (if (> (count (clojure.set/intersection (set (range lb1 (inc ub1))) (set (range lb2 (inc ub2))))) 0)
            (println (inc count-subsets))
            (println count-subsets)))))))