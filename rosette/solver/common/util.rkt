#lang racket

(require (only-in "../../base/core/term.rkt" term? term-type)
         (only-in "../../base/core/bool.rkt" @boolean?))

(provide filter-asserts)

(define (filter-asserts asserts)
  (for/list ([a asserts] #:unless (equal? a #t))
    (unless (or (boolean? a) (and (term? a) (equal? @boolean? (term-type a))))
      (error 'assert "expected a boolean value, given ~s" a))
    a))