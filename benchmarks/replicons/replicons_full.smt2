(set-logic QF_NRA_ODE)
(declare-fun deltaE () Real [0, 100])
(declare-fun lambdaE () Real [0, 100])
(declare-fun S () Real [0, 120000000])
(declare-fun noise () Real [0.01, 0.01])

(declare-fun sample_5_0 () Real [10000000, 10000000])
(declare-fun sample_5_3 () Real [20000000, 20000000])
(declare-fun sample_7_0 () Real [38000000, 38000000])
(declare-fun sample_7_3 () Real [45000000, 45000000])
(declare-fun sample_9_0 () Real [50000000, 50000000])
(declare-fun sample_9_3 () Real [65000000, 65000000])
(declare-fun sample_11_0 () Real [65000000, 65000000])
(declare-fun sample_11_3 () Real [72000000, 72000000])
(declare-fun sample_16_0 () Real [65000000, 65000000])
(declare-fun sample_16_3 () Real [85000000, 85000000])
(declare-fun sample_19_0 () Real [80000000, 80000000])
(declare-fun sample_19_3 () Real [90000000, 90000000])
(declare-fun sample_21_0 () Real [90000000, 90000000])
(declare-fun sample_21_3 () Real [95000000, 95000000])
(declare-fun sample_26_0 () Real [95000000, 95000000])
(declare-fun sample_26_3 () Real [110000000, 110000000])

(declare-fun e_5 () Real [0, 120000000])
(declare-fun e_7 () Real [0, 120000000])
(declare-fun e_9 () Real [0, 120000000])
(declare-fun e_11 () Real [0, 120000000])
(declare-fun e_16 () Real [0, 120000000])
(declare-fun e_19 () Real [0, 120000000])
(declare-fun e_21 () Real [0, 120000000])
(declare-fun e_26 () Real [0, 120000000])

(assert (and

(= v_0 (* (/ 1 (* sigma (sqrt (* 2 3.14156)))) (^ euler (* -1 (/ (^ (- 0 0) 2) (* 2 (^ sigma 2)))))))
(= d_0 540)
(= alpha 0.0127)
(= lambda_0_0 (* alpha v_0 d_0))
(= f_0_0 (/ (* (^ lambda_0_0_0 0) (^ euler (* -1 lambda_0_0_0))) (1)))

(= e_50_0 

(< e_5 (+ sample_5_3 (* noise (- sample_5_3 sample_5_0))))
(> e_5 (- sample_5_0 (* noise (- sample_5_3 sample_5_0))))
(= e_5 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 5) lambdaE))))))

(< e_7 (+ sample_7_3 (* noise (- sample_7_3 sample_7_0))))
(> e_7 (- sample_7_0 (* noise (- sample_7_3 sample_7_0))))
(= e_7 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 7) lambdaE))))))

(< e_9 (+ sample_9_3 (* noise (- sample_9_3 sample_9_0))))
(> e_9 (- sample_9_0 (* noise (- sample_9_3 sample_9_0))))
(= e_9 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 9) lambdaE))))))

(< e_11 (+ sample_11_3 (* noise (- sample_11_3 sample_11_0))))
(> e_11 (- sample_11_0 (* noise (- sample_11_3 sample_11_0))))
(= e_11 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 11) lambdaE))))))

(< e_16 (+ sample_16_3 (* noise (- sample_16_3 sample_16_0))))
(> e_16 (- sample_16_0 (* noise (- sample_16_3 sample_16_0))))
(= e_16 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 16) lambdaE))))))

(< e_19 (+ sample_19_3 (* noise (- sample_19_3 sample_19_0))))
(> e_19 (- sample_19_0 (* noise (- sample_19_3 sample_19_0))))
(= e_19 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 19) lambdaE))))))

(< e_21 (+ sample_21_3 (* noise (- sample_21_3 sample_21_0))))
(> e_21 (- sample_21_0 (* noise (- sample_21_3 sample_21_0))))
(= e_21 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 21) lambdaE))))))

(< e_26 (+ sample_26_3 (* noise (- sample_26_3 sample_26_0))))
(> e_26 (- sample_26_0 (* noise (- sample_26_3 sample_26_0))))
(= e_26 (max 0 (* S (- 1 (^ 2 (/ (- deltaE 26) lambdaE))))))

))
(check-sat)
(exit)