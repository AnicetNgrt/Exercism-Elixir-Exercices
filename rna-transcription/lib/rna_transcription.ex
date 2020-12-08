defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    [head | tail] = dna
    head = case head do
      ?G -> 'C'
      ?C -> 'G'
      ?T -> 'A'
      ?A -> 'U'
    end
    case tail do
      [] -> head
      _ -> head ++ to_rna(tail)
    end
  end
end
