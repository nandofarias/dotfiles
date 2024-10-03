import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

defmodule Dbg do
  @doc """
  Convenience for erlang:dbg
  See https://erlang.org/doc/man/dbg.html.
  # Example
    # start tracer
    {:ok, _} = Dbg.tracer()
    # Trace all calls for all process
    {:ok, _} = Dbg.process(:all, :c)
    # See all calls and returns for a module
    {:ok, _} = Dbg.trace_pattern(Blvd.BulkImport.Data, :cx)
    # See all calls for a specific function with any arity
    {:ok, _} = Dbg.trace_pattern({Blvd.BulkImport.Data, :process, :_}, :c)
    # See all calls for a specific function with a specific arity
    {:ok, _} = Dbg.trace_pattern({Blvd.BulkImport.Data, :process, 3}, :c)
  """
  def tracer(opts \\ []) do
    handler = Keyword.get(opts, :handler, &handler/2)
    :dbg.tracer(:process, {handler, :init})
  end

  def handler(msg, _state) do
    import IO.ANSI

    case msg do
      {:trace, _pid, :exception_from, {m, f, arity}, reason} ->
        m = format_module(m)
        f = to_string(f)
        arity = to_string(arity)

        IO.ANSI.format([
          red(),
          "[exception #{m}.#{f}/#{arity}]",
          "\n⚠︎ ",
          inspect(reason),
          "\n"
        ])
        |> IO.iodata_to_binary()
        |> IO.puts()

      {:trace, _pid, :return_from, {m, f, arity}, return} ->
        m = format_module(m)
        f = to_string(f)
        arity = to_string(arity)

        out =
          IO.ANSI.format([
            blue(),
            "[return]",
            reset(),
            "\n",
            "↲ ",
            cyan(),
            m,
            reset(),
            ".",
            f,
            reset(),
            "/",
            yellow(),
            arity,
            black(),
            " #=> ",
            reset(),
            inspect(return, pretty: true, syntax_colors: syntax_colors()),
            "\n"
          ])

        :ok =
          out
          |> IO.iodata_to_binary()
          |> IO.puts()

      {:trace, _pid, :call, {m, f, args}}
      when is_atom(m) and is_atom(f) and is_list(args) ->
        m = format_module(m)
        f = to_string(f)

        IO.ANSI.format([
          magenta(),
          "[call]",
          "\n",
          reset(),
          "↳ ",
          cyan(),
          m,
          reset(),
          ".",
          f,
          "(",
          inspect(args, pretty: true, syntax_colors: syntax_colors()),
          ")",
          "\n"
        ])
        |> IO.iodata_to_binary()
        |> IO.puts()

      {:trace, _pid, :call, {m, f, args}, {caller_m, caller_f, caller_a, {caller_file, caller_lnum}}}
      when is_atom(m) and is_atom(f) and is_list(args) and is_list(caller_file) and is_integer(caller_lnum) ->
        m = format_module(m)
        caller_m = format_module(caller_m)
        f = to_string(f)

        IO.ANSI.format([
          magenta(),
          "[call #{caller_file}:#{caller_lnum}: #{caller_m}.#{caller_f}/#{caller_a}]",
          "\n",
          reset(),
          "↳ ",
          cyan(),
          m,
          reset(),
          ".",
          f,
          "(",
          inspect(args, pretty: true, syntax_colors: syntax_colors()),
          ")",
          "\n"
        ])
        |> IO.iodata_to_binary()
        |> IO.puts()
    end
  end

  for {name, target} <- [
        p: :p,
        process: :p
      ] do
    defdelegate unquote(name)(item), to: :dbg, as: target
    defdelegate unquote(name)(item, flags), to: :dbg, as: target
  end

  for {name, target} <- [
        tp: :tp,
        trace_pattern: :tp,
        tpl: :tpl,
        trace_pattern_local: :tpl
      ] do
    defdelegate unquote(name)(module_or_mfa, match_spec), to: :dbg, as: target
    defdelegate unquote(name)(module, function, match_spec), to: :dbg, as: target
    defdelegate unquote(name)(module, function, arity, match_spec), to: :dbg, as: target
  end

  for {name, target} <- [
        ctp: :ctp,
        clear_trace_pattern: :ctp,
        ctpl: :ctpl,
        clear_trace_pattern_local: :ctpl
      ] do
    defdelegate unquote(name)(module_or_mfa), to: :dbg, as: target
    defdelegate unquote(name)(module, function), to: :dbg, as: target
    defdelegate unquote(name)(module, function, arity), to: :dbg, as: target
  end

  defp format_module(m) when is_atom(m), do: format_module(Atom.to_string(m))
  defp format_module("Elixir." <> m), do: m
  defp format_module(m), do: m
end

defmodule IExHelpers do
  def whats_this?(term) when is_nil(term), do: "Type: Nil"
  def whats_this?(term) when is_binary(term), do: "Type: Binary"
  def whats_this?(term) when is_boolean(term), do: "Type: Boolean"
  def whats_this?(term) when is_atom(term), do: "Type: Atom"
  def whats_this?(_term), do: "Type: Unknown"
end

IEx.configure(
  inspect: [limit: :infinity],
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: [:light_blue],
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ]
)
