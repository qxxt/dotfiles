(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-format-buffer t t)
  (add-hook 'before-save-hook 'lsp-organize-imports t t))
(add-hook 'go-mode-hook 'lsp-go-install-save-hooks)
(add-hook 'go-mode-hook 'display-line-numbers-mode)
(lsp-register-custom-settings
 '(("gopls.usePlaceholders" t t)))


(defun open-url-android (url &rest ignore)
      (interactive "sURL: ")
      (shell-command (concat "am start -a android.intent.action.VIEW -d '" url "'")))
