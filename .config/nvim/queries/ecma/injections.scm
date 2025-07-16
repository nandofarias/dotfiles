; ~/.config/nvim/queries/ecma/injections.scm
; https://neovim.io/doc/user/treesitter.html#treesitter-query-modeline
;; extends

; Anywhere there is a tagged template literal where the tag ends with `gql`,
; treat its content as GraphQL.
(call_expression
  function: (identifier) @_name
  (#lua-match? @_name "gql$")
  arguments: (template_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "graphql"))
