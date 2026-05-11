;; letter-drop -- claim the next letter from a cycling a..z drop
;; Clarity 4

(define-data-var next-letter uint u1)
(define-data-var total-drops uint u0)
(define-map user-letters principal (list 200 uint))

(define-public (claim)
  (let ((letter (var-get next-letter))
        (existing (default-to (list) (map-get? user-letters tx-sender))))
    (map-set user-letters tx-sender (unwrap! (as-max-len? (append existing letter) u200) (err u101)))
    (var-set next-letter (if (>= letter u26) u1 (+ letter u1)))
    (var-set total-drops (+ (var-get total-drops) u1))
    (print { event: "claim", letter: letter, user: tx-sender })
    (ok letter)))

(define-read-only (get-letters (user principal))
  (default-to (list) (map-get? user-letters user)))

(define-read-only (peek-next)
  (var-get next-letter))

(define-read-only (total)
  (var-get total-drops))
