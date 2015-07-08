(set-logic QF_NRA_ODE)
(declare-fun tau () Real)
(declare-fun x1 () Real)
(declare-fun x2 () Real)
(declare-fun x3 () Real)
(define-ode flow_1 ((= d/dt[tau] 1)))
(define-ode flow_2 ((= d/dt[x1] (* 0.015 (- 100 (+ (* (- 1 0.03) x1) (* 0.01 x2) (* 0.02 x3)))))))
(define-ode flow_3 ((= d/dt[x1] (* -0.015 (+ (* (- 1 0.03) x1) (* 0.01 x2) (* 0.02 x3))))))
(define-ode flow_4 ((= d/dt[x2] (* 0.045 (- 200 (+ (* (- 1 0.06) x2) (* 0.01 x1) (* 0.05 x3)))))))
(define-ode flow_5 ((= d/dt[x2] (* -0.045 (+ (* (- 1 0.06) x2) (* 0.01 x1) (* 0.05 x3))))))
(define-ode flow_6 ((= d/dt[x3] (* 0.03 (- 300 (+ (* (- 1 0.07) x3) (* 0.02 x1) (* 0.05 x2)))))))
(define-ode flow_7 ((= d/dt[x3] (* -0.03 (+ (* (- 1 0.07) x3) (* 0.02 x1) (* 0.05 x2))))))
(declare-fun time_0 () Real)  
(declare-fun tau_0_0 () Real) 
(declare-fun tau_0_t () Real)
(declare-fun mode1_0 () Bool) 
(declare-fun x1_0_0 () Real)  
(declare-fun x1_0_t () Real)
(declare-fun mode2_0 () Bool)
(declare-fun x2_0_0 () Real)  
(declare-fun x2_0_t () Real)
(declare-fun mode3_0 () Bool)
(declare-fun x3_0_0 () Real)  
(declare-fun x3_0_t () Real)
(declare-fun time_1 () Real)  
(declare-fun tau_1_0 () Real) 
(declare-fun tau_1_t () Real)
(declare-fun mode1_1 () Bool) 
(declare-fun x1_1_0 () Real)  
(declare-fun x1_1_t () Real)
(declare-fun mode2_1 () Bool)
(declare-fun x2_1_0 () Real)  
(declare-fun x2_1_t () Real)
(declare-fun mode3_1 () Bool)
(declare-fun x3_1_0 () Real)  
(declare-fun x3_1_t () Real)
(declare-fun time_2 () Real)  
(declare-fun tau_2_0 () Real) 
(declare-fun tau_2_t () Real)
(declare-fun mode1_2 () Bool) 
(declare-fun x1_2_0 () Real)  
(declare-fun x1_2_t () Real)
(declare-fun mode2_2 () Bool)
(declare-fun x2_2_0 () Real)  
(declare-fun x2_2_t () Real)
(declare-fun mode3_2 () Bool)
(declare-fun x3_2_0 () Real)  
(declare-fun x3_2_t () Real)
(declare-fun time_3 () Real)  
(declare-fun tau_3_0 () Real) 
(declare-fun tau_3_t () Real)
(declare-fun mode1_3 () Bool) 
(declare-fun x1_3_0 () Real)  
(declare-fun x1_3_t () Real)
(declare-fun mode2_3 () Bool)
(declare-fun x2_3_0 () Real)  
(declare-fun x2_3_t () Real)
(declare-fun mode3_3 () Bool)
(declare-fun x3_3_0 () Real)  
(declare-fun x3_3_t () Real)
(declare-fun time_4 () Real)  
(declare-fun tau_4_0 () Real) 
(declare-fun tau_4_t () Real)
(declare-fun mode1_4 () Bool) 
(declare-fun x1_4_0 () Real)  
(declare-fun x1_4_t () Real)
(declare-fun mode2_4 () Bool)
(declare-fun x2_4_0 () Real)  
(declare-fun x2_4_t () Real)
(declare-fun mode3_4 () Bool)
(declare-fun x3_4_0 () Real)  
(declare-fun x3_4_t () Real)
(assert (<= 0 time_0))  (assert (<= time_0 1))
(assert (<= 0 tau_0_0)) (assert (<= tau_0_0 1))
(assert (<= 0 tau_0_t)) (assert (<= tau_0_t 1))
(assert (<= -20 x1_0_0)) (assert (<= x1_0_0 100))
(assert (<= -20 x1_0_t)) (assert (<= x1_0_t 100))
(assert (<= -20 x2_0_0)) (assert (<= x2_0_0 100))
(assert (<= -20 x2_0_t)) (assert (<= x2_0_t 100))
(assert (<= -20 x3_0_0)) (assert (<= x3_0_0 100))
(assert (<= -20 x3_0_t)) (assert (<= x3_0_t 100))
(assert (<= 0 time_1))  (assert (<= time_1 1))
(assert (<= 0 tau_1_0)) (assert (<= tau_1_0 1))
(assert (<= 0 tau_1_t)) (assert (<= tau_1_t 1))
(assert (<= -20 x1_1_0)) (assert (<= x1_1_0 100))
(assert (<= -20 x1_1_t)) (assert (<= x1_1_t 100))
(assert (<= -20 x2_1_0)) (assert (<= x2_1_0 100))
(assert (<= -20 x2_1_t)) (assert (<= x2_1_t 100))
(assert (<= -20 x3_1_0)) (assert (<= x3_1_0 100))
(assert (<= -20 x3_1_t)) (assert (<= x3_1_t 100))
(assert (<= 0 time_2))  (assert (<= time_2 1))
(assert (<= 0 tau_2_0)) (assert (<= tau_2_0 1))
(assert (<= 0 tau_2_t)) (assert (<= tau_2_t 1))
(assert (<= -20 x1_2_0)) (assert (<= x1_2_0 100))
(assert (<= -20 x1_2_t)) (assert (<= x1_2_t 100))
(assert (<= -20 x2_2_0)) (assert (<= x2_2_0 100))
(assert (<= -20 x2_2_t)) (assert (<= x2_2_t 100))
(assert (<= -20 x3_2_0)) (assert (<= x3_2_0 100))
(assert (<= -20 x3_2_t)) (assert (<= x3_2_t 100))
(assert (<= 0 time_3))  (assert (<= time_3 1))
(assert (<= 0 tau_3_0)) (assert (<= tau_3_0 1))
(assert (<= 0 tau_3_t)) (assert (<= tau_3_t 1))
(assert (<= -20 x1_3_0)) (assert (<= x1_3_0 100))
(assert (<= -20 x1_3_t)) (assert (<= x1_3_t 100))
(assert (<= -20 x2_3_0)) (assert (<= x2_3_0 100))
(assert (<= -20 x2_3_t)) (assert (<= x2_3_t 100))
(assert (<= -20 x3_3_0)) (assert (<= x3_3_0 100))
(assert (<= -20 x3_3_t)) (assert (<= x3_3_t 100))
(assert (<= 0 time_4))  (assert (<= time_4 1))
(assert (<= 0 tau_4_0)) (assert (<= tau_4_0 1))
(assert (<= 0 tau_4_t)) (assert (<= tau_4_t 1))
(assert (<= -20 x1_4_0)) (assert (<= x1_4_0 100))
(assert (<= -20 x1_4_t)) (assert (<= x1_4_t 100))
(assert (<= -20 x2_4_0)) (assert (<= x2_4_0 100))
(assert (<= -20 x2_4_t)) (assert (<= x2_4_t 100))
(assert (<= -20 x3_4_0)) (assert (<= x3_4_0 100))
(assert (<= -20 x3_4_t)) (assert (<= x3_4_t 100))
(assert (= tau_0_0 0))
(assert (= mode1_0 true))
(assert (and (>= x1_0_0 (- 20 1)) (<= x1_0_0 (+ 20 1))))
(assert (= mode2_0 true))
(assert (and (>= x2_0_0 (- 20 1)) (<= x2_0_0 (+ 20 1))))
(assert (= mode3_0 true))
(assert (and (>= x3_0_0 (- 20 1)) (<= x3_0_0 (+ 20 1))))
(assert (and (>= tau_0_0 0) (<= tau_0_0 1)
             (>= tau_0_t 0) (<= tau_0_t 1)
             (forall_t 1 [0 time_0] (>= tau_0_t 0))
             (forall_t 2 [0 time_0] (<= tau_0_t 1))))
(assert (and (= [x1_0_t x2_0_t x3_0_t tau_0_t] 
                (pintegral 0. time_0 
                           [x1_0_0 x2_0_0 x3_0_0 tau_0_0]
                           [holder_1 holder_2 holder_3 holder_4]))
             (connect holder_4 flow_1)))
(assert (or (and (= mode1_0 true) (connect holder_1 flow_2))
            (and (= mode1_0 false) (connect holder_1 flow_3))))
(assert (not (and (connect holder_1 flow_2) (connect holder_1 flow_3))))
(assert (or (and (= mode2_0 true) (connect holder_2 flow_4))
            (and (= mode2_0 false) (connect holder_2 flow_5))))
(assert (not (and (connect holder_2 flow_4) (connect holder_2 flow_5))))
(assert (or (and (= mode3_0 true) (connect holder_3 flow_6))
            (and (= mode3_0 false) (connect holder_3 flow_7))))
(assert (not (and (connect holder_3 flow_6) (connect holder_3 flow_7))))
(assert (and (= tau_0_t 1) (= tau_1_0 0)))
(assert (and (= x1_1_0 x1_0_t)))
(assert (or (and (<= x1_0_t 20) (= mode1_1 true))
            (and (> x1_0_t 20) (= mode1_1 false))))
(assert (and (= x2_1_0 x2_0_t)))
(assert (or (and (<= x2_0_t 20) (= mode2_1 true))
            (and (> x2_0_t 20) (= mode2_1 false))))
(assert (and (= x3_1_0 x3_0_t)))
(assert (or (and (<= x3_0_t 20) (= mode3_1 true))
            (and (> x3_0_t 20) (= mode3_1 false))))
(assert (and (>= tau_1_0 0) (<= tau_1_0 1)
             (>= tau_1_t 0) (<= tau_1_t 1)
             (forall_t 1 [0 time_1] (>= tau_1_t 0))
             (forall_t 2 [0 time_1] (<= tau_1_t 1))))
(assert (and (= [x1_1_t x2_1_t x3_1_t tau_1_t] 
                (pintegral 0. time_1 
                           [x1_1_0 x2_1_0 x3_1_0 tau_1_0]
                           [holder_5 holder_6 holder_7 holder_8]))
             (connect holder_8 flow_1)))
(assert (or (and (= mode1_1 true) (connect holder_5 flow_2))
            (and (= mode1_1 false) (connect holder_5 flow_3))))
(assert (not (and (connect holder_5 flow_2) (connect holder_5 flow_3))))
(assert (or (and (= mode2_1 true) (connect holder_6 flow_4))
            (and (= mode2_1 false) (connect holder_6 flow_5))))
(assert (not (and (connect holder_6 flow_4) (connect holder_6 flow_5))))
(assert (or (and (= mode3_1 true) (connect holder_7 flow_6))
            (and (= mode3_1 false) (connect holder_7 flow_7))))
(assert (not (and (connect holder_7 flow_6) (connect holder_7 flow_7))))
(assert (and (= tau_1_t 1) (= tau_2_0 0)))
(assert (and (= x1_2_0 x1_1_t)))
(assert (or (and (<= x1_1_t 20) (= mode1_2 true))
            (and (> x1_1_t 20) (= mode1_2 false))))
(assert (and (= x2_2_0 x2_1_t)))
(assert (or (and (<= x2_1_t 20) (= mode2_2 true))
            (and (> x2_1_t 20) (= mode2_2 false))))
(assert (and (= x3_2_0 x3_1_t)))
(assert (or (and (<= x3_1_t 20) (= mode3_2 true))
            (and (> x3_1_t 20) (= mode3_2 false))))
(assert (and (>= tau_2_0 0) (<= tau_2_0 1)
             (>= tau_2_t 0) (<= tau_2_t 1)
             (forall_t 1 [0 time_2] (>= tau_2_t 0))
             (forall_t 2 [0 time_2] (<= tau_2_t 1))))
(assert (and (= [x1_2_t x2_2_t x3_2_t tau_2_t] 
                (pintegral 0. time_2 
                           [x1_2_0 x2_2_0 x3_2_0 tau_2_0]
                           [holder_9 holder_10 holder_11 holder_12]))
             (connect holder_12 flow_1)))
(assert (or (and (= mode1_2 true) (connect holder_9 flow_2))
            (and (= mode1_2 false) (connect holder_9 flow_3))))
(assert (not (and (connect holder_9 flow_2) (connect holder_9 flow_3))))
(assert (or (and (= mode2_2 true) (connect holder_10 flow_4))
            (and (= mode2_2 false) (connect holder_10 flow_5))))
(assert (not (and (connect holder_10 flow_4) (connect holder_10 flow_5))))
(assert (or (and (= mode3_2 true) (connect holder_11 flow_6))
            (and (= mode3_2 false) (connect holder_11 flow_7))))
(assert (not (and (connect holder_11 flow_6) (connect holder_11 flow_7))))
(assert (and (= tau_2_t 1) (= tau_3_0 0)))
(assert (and (= x1_3_0 x1_2_t)))
(assert (or (and (<= x1_2_t 20) (= mode1_3 true))
            (and (> x1_2_t 20) (= mode1_3 false))))
(assert (and (= x2_3_0 x2_2_t)))
(assert (or (and (<= x2_2_t 20) (= mode2_3 true))
            (and (> x2_2_t 20) (= mode2_3 false))))
(assert (and (= x3_3_0 x3_2_t)))
(assert (or (and (<= x3_2_t 20) (= mode3_3 true))
            (and (> x3_2_t 20) (= mode3_3 false))))
(assert (and (>= tau_3_0 0) (<= tau_3_0 1)
             (>= tau_3_t 0) (<= tau_3_t 1)
             (forall_t 1 [0 time_3] (>= tau_3_t 0))
             (forall_t 2 [0 time_3] (<= tau_3_t 1))))
(assert (and (= [x1_3_t x2_3_t x3_3_t tau_3_t] 
                (pintegral 0. time_3 
                           [x1_3_0 x2_3_0 x3_3_0 tau_3_0]
                           [holder_13 holder_14 holder_15 holder_16]))
             (connect holder_16 flow_1)))
(assert (or (and (= mode1_3 true) (connect holder_13 flow_2))
            (and (= mode1_3 false) (connect holder_13 flow_3))))
(assert (not (and (connect holder_13 flow_2) (connect holder_13 flow_3))))
(assert (or (and (= mode2_3 true) (connect holder_14 flow_4))
            (and (= mode2_3 false) (connect holder_14 flow_5))))
(assert (not (and (connect holder_14 flow_4) (connect holder_14 flow_5))))
(assert (or (and (= mode3_3 true) (connect holder_15 flow_6))
            (and (= mode3_3 false) (connect holder_15 flow_7))))
(assert (not (and (connect holder_15 flow_6) (connect holder_15 flow_7))))
(assert (and (= tau_3_t 1) (= tau_4_0 0)))
(assert (and (= x1_4_0 x1_3_t)))
(assert (or (and (<= x1_3_t 20) (= mode1_4 true))
            (and (> x1_3_t 20) (= mode1_4 false))))
(assert (and (= x2_4_0 x2_3_t)))
(assert (or (and (<= x2_3_t 20) (= mode2_4 true))
            (and (> x2_3_t 20) (= mode2_4 false))))
(assert (and (= x3_4_0 x3_3_t)))
(assert (or (and (<= x3_3_t 20) (= mode3_4 true))
            (and (> x3_3_t 20) (= mode3_4 false))))
(assert (and (>= tau_4_0 0) (<= tau_4_0 1)
             (>= tau_4_t 0) (<= tau_4_t 1)
             (forall_t 1 [0 time_4] (>= tau_4_t 0))
             (forall_t 2 [0 time_4] (<= tau_4_t 1))))
(assert (and (= [x1_4_t x2_4_t x3_4_t tau_4_t] 
                (pintegral 0. time_4 
                           [x1_4_0 x2_4_0 x3_4_0 tau_4_0]
                           [holder_17 holder_18 holder_19 holder_20]))
             (connect holder_20 flow_1)))
(assert (or (and (= mode1_4 true) (connect holder_17 flow_2))
            (and (= mode1_4 false) (connect holder_17 flow_3))))
(assert (not (and (connect holder_17 flow_2) (connect holder_17 flow_3))))
(assert (or (and (= mode2_4 true) (connect holder_18 flow_4))
            (and (= mode2_4 false) (connect holder_18 flow_5))))
(assert (not (and (connect holder_18 flow_4) (connect holder_18 flow_5))))
(assert (or (and (= mode3_4 true) (connect holder_19 flow_6))
            (and (= mode3_4 false) (connect holder_19 flow_7))))
(assert (not (and (connect holder_19 flow_6) (connect holder_19 flow_7))))
(assert (or (< x1_4_t (- 20 1)) (> x1_4_t (+ 20 1))))
(assert (or (< x2_4_t (- 20 1)) (> x2_4_t (+ 20 1))))
(assert (or (< x3_4_t (- 20 1)) (> x3_4_t (+ 20 1))))
(check-sat)
(exit)
