; ~/.config/nvim/queries/elixir/injections.scm
; https://neovim.io/doc/user/treesitter.html#treesitter-query-modeline
;; extends

; Anywhere there is a string as a value in a map within `telemetry_event`, that
; appears to have an Elixir map embedded as a string, treat it as Elixir.
(call
  target: ((identifier) @_identifier
                        (#eq? @_identifier "telemetry_event"))
  (arguments
    (map
      (map_content
        (keywords
          (pair
            value: (string
                     (quoted_content) @injection.content
                     (#lua-match? @injection.content "^[\n|\t| ]*%%\{.*\}[\n|\t| ]*$")

                     ) @match
            (#set! injection.language "elixir")))))))

; Anywhere there is a key named `html:`, treat the value as HTML.
(pair
  key: ((keyword) @keyword
                  (#contains? @keyword "html:")
                  ) @kw_match
  value: (string (quoted_content) @injection.content
                 (#lua-match? @injection.content "^[\n|\t| ]*\<")
                 ) @html
  (#set! injection.language "html"))

; Implement `~G` sigil string content as GraphQL.
(sigil
  (sigil_name) @_sigil_name
  (quoted_content) @injection.content
  (#eq? @_sigil_name "G")
  (#set! injection.language "graphql"))

; Treat any string passed to `Repo.query` as raw SQL.
(call
  (dot left: (alias) @_alias (#lua-match? @_alias "Repo$") right: (identifier) @_identifier (#eq? @_identifier "query!"))
  (arguments (string (quoted_content) @injection.content))
  (#set! injection.language "sql"))

; Treat any string with obviously-SQL content as raw SQL.
(string
  (quoted_content) @injection.content
  (#vim-match? @injection.content "^.*(INSERT INTO|SELECT|FROM|JOIN|WHERE|CREATE|DROP|INSERT|UPDATE|ALTER|NOW\(\)).*$")
  (#set! injection.language "sql"))
