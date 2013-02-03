(setq frame-title-format
  '("Arsenal till I die ~~~ " invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

(buffer-file-name)


(provide 'init-frametitle)
