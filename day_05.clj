(require '[clojure.java.io :as io])

(def els_1 ["F", "T", "C", "L", "R", "P", "G", "Q"])
(def els_2 ["N", "Q", "H", "W", "R", "F", "S", "J"])
(def els_3 ["F", "B", "H", "W", "P", "M", "Q"])
(def els_4 ["V", "S", "T", "D", "F"])
(def els_5 ["Q", "L", "D", "W", "V", "F", "Z"])
(def els_6 ["Z", "C", "L", "S"])
(def els_7 ["Z", "B", "M", "V", "D", "F"])
(def els_8 ["T", "J", "B"])
(def els_9 ["Q", "N", "B", "G", "L", "S", "P", "H"])

(def list_els [els_1, els_2, els_3, els_4, els_5, els_6, els_7, els_8, els_9])

;; part-01

(with-open [rdr (io/reader "resources/input_05.txt")] ;; without graph of initial stacks
  (let [lines (line-seq rdr) num-rows (- (count lines) 1)]
    (loop [line (first lines) idx 0
           stacks list_els
           steps (Integer/parseInt (nth (re-seq #"\d+" line) 0))
           stack-origin (- (Integer/parseInt (nth (re-seq #"\d+" line) 1)) 1)
           stack-destination (- (Integer/parseInt (nth (re-seq #"\d+" line) 2)) 1)
           els-temp-orig (nth stacks stack-origin)
           els-temp-dest (nth stacks stack-destination)
           idy 0]
      (if (< idx num-rows)
        (if (< idy steps)
          (recur line
                 idx
                 stacks
                 steps
                 stack-origin
                 stack-destination
                 (vec (butlast els-temp-orig))
                 (vec (concat els-temp-dest (vector (last els-temp-orig))))
                 (inc idy))
          (recur (nth lines (inc idx))
                 (inc idx)
                 (-> stacks
                     (assoc stack-origin els-temp-orig)
                     (assoc stack-destination els-temp-dest))
                 (Integer/parseInt (nth (re-seq #"\d+" (nth lines (inc idx))) 0))
                 (- (Integer/parseInt (nth (re-seq #"\d+" (nth lines (inc idx))) 1)) 1)
                 (- (Integer/parseInt (nth (re-seq #"\d+" (nth lines (inc idx))) 2)) 1)
                 (nth (-> stacks
                          (assoc stack-origin els-temp-orig)
                          (assoc stack-destination els-temp-dest)) (- (Integer/parseInt (nth (re-seq #"\d+" (nth lines (inc idx))) 1)) 1))
                 (nth (-> stacks
                          (assoc stack-origin els-temp-orig)
                          (assoc stack-destination els-temp-dest)) (- (Integer/parseInt (nth (re-seq #"\d+" (nth lines (inc idx))) 2)) 1))
                 0))
        (if (< idy steps)
          (recur line
                 idx
                 stacks
                 steps
                 stack-origin
                 stack-destination
                 (vec (butlast els-temp-orig))
                 (vec (concat els-temp-dest (vector (last els-temp-orig))))
                 (inc idy))
          (mapv last (-> stacks
                         (assoc stack-origin els-temp-orig)
                         (assoc stack-destination els-temp-dest))))))))