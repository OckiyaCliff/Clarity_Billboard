
;; title: billboard
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; err constants
(define-constant ERR_STX_TRANSFER u100)
;;

;; data vars
(define-data-var billboard-message (string-utf8 500) u"Hello, World!")
(define-data-var price uint u100)
;;

;; data maps
;;

;; public functions
(define-read-only (get-price) 
    (var-get price)
)

(define-read-only (get-message) 
    (var-get billboard-message)
)

(define-public (set-message (message (string-utf8 500))) 
    (let ((cur-price (var-get price))
          (new-price (+ u20 cur-price)))

    ;; pay the contract
    (unwrap! (stx-transfer? cur-price tx-sender (as-contract tx-sender)) (err tx-sender))

    ;; update the billboard's message
    ;; #[allow(unchecked_data)]
    (var-set billboard-message message)

    ;; update the price of setting a message 
    (var-set price new-price)

    ;; return the updated price
    (ok new-price)
    
    )
    
)
;;

;; read only functions
;;

;; private functions
;;

