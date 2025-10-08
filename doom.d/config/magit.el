;;; config/magit.el -*- lexical-binding: t; -*-

;; magit の status buffer から stage 済みのファイルを選択したときに
;; readonly の buffer ではなく、編集可能な実際のファイルを開くようにする

(after! magit
	;; stage 済みのファイルを開くときに、実際のファイルを開く
	(setq magit-diff-visit-previous-blob nil)

	;; または、以下の設定で RET の動作をカスタマイズ
	(defun my/magit-diff-visit-file-worktree ()
	  "Visit the current file in the worktree instead of showing the blob."
	  (interactive)
	  (let ((file (magit-file-at-point)))
	    (when file
              (find-file (expand-file-name file (magit-toplevel))))))

	;; magit-status-mode と magit-diff-mode で RET の動作を上書き
	(map! :map magit-status-mode-map
              :n "RET" #'magit-diff-visit-worktree-file)
	(map! :map magit-diff-mode-map
              :n "RET" #'magit-diff-visit-worktree-file))
