defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    ignore_pattern = [",","!","?","&","@","$","%","^","_",":"]
    String.replace(sentence, ignore_pattern, " ")
      |> String.split(" ")
      |> Enum.filter(fn word -> word != "" end)
      |> Enum.reduce(%{}, fn word, acc ->
          lowercase = String.downcase(word)
          {word, val} = case acc do
            %{^lowercase => val} -> {lowercase, val+1}
            _ -> {lowercase, 1}
          end
          Map.put(acc, word, val)
        end)
  end
end
