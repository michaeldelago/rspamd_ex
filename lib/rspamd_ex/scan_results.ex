defmodule RspamdEx.Client.ScanResults do
  @derive Jason.Encoder
  defstruct action: "",
            filename: "",
            is_skipped: false,
            "message-id": "",
            messages: %{},
            milter: %{},
            required_score: 0.0,
            scan_time: 0.0,
            score: 0.0,
            symbols: %{},
            time_real: 0.0

  @spec spam?(%{required_score: integer(), score: integer()}) :: boolean()
  def spam?(results) do
    results.required_score < results.score
  end

  @spec ham?(%{required_score: integer(), score: integer()}) :: boolean()
  def ham?(%__MODULE__{} = results) do
    !spam?(results)
  end
end
