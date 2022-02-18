defmodule B2Web.Live.Game.WordSoFar do

  use B2Web, :live_component

  @states %{
    won:          "Congratulations, you won!",
    lost:         "Too bad. You lost.",
    good_guess:   "Good guess.",
    bad_guess:    "Bad guess.",
    already_used: "You've already used that letter.",
    invalid:      "That's not a valid guess. Must be a lower-case a-z.",
    initializing: "Enter or select your first guess."
  }

  def mount(socket) do
    {:ok, socket}
  end

  defp state_name(state) do
    @states[state] || "Unknown state"
  end

  def render(assigns) do
    ~H"""
    <div class="word-so-far">
      <div class="game-state">
        <%= state_name(@tally.game_state) %>
      </div>
      <div class="letters">
        <%= for ch <- @tally.letters do %>
          <% cls = if ch != "_", do: "one-letter correct", else: "one-letter" %>
        <div class={cls}>
          <%= ch %>
        </div>
        <% end %>
        </div>
    </div>
    """
  end

end