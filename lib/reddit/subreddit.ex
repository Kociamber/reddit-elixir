defmodule Reddit.Subreddit do
  @moduledoc """
  Operations to do with subreddits

  Shared options:
  - limit [int]: the max number of objects the list should return, default 10.
  - after [str]: the "fullname" of the start of the slice, usually of the form
                 t3_id
  - before [str]: the "fullname" of the end of the slice
  """

  @default_options [limit: 10]

  @doc """
  Get the top posts for a given subreddit

      iex> top_posts(client, "evangelion")
      {:ok, %Tesla.Env{body: %{"data" => %{...}}}
  """
  def top_posts(client, subreddit, opts \\ @default_options) do
    client
    |> Tesla.get("/r/#{subreddit}/top/", query: opts)
  end

  @doc """
  Get the new posts for a given subreddit

      iex> new_posts(client, "evangelion")
      {:ok, %Tesla.Env{body: %{"data" => %{...}}}
  """
  def new_posts(client, subreddit, opts \\ @default_options) do
    client
    |> Tesla.get("/r/#{subreddit}/new/", query: opts)
  end

  @doc """
  Get the hot posts for a given subreddit

      iex> hot_posts(client, "evangelion")
      {:ok, %Tesla.Env{body: %{"data" => %{...}}}
  """
  def hot_posts(client, subreddit, opts \\ @default_options) do
    client
    |> Tesla.get("/r/#{subreddit}/hot/", query: opts)
  end

  @doc """
  Get the comments for a given post

      iex> fetch_comments(client, "/r/RobinHoodPennyStocks/comments/lfqrkk/daily_discussion_thread/")
      {:ok, %Tesla.Env{body: %{"data" => %{...}}}
  """
  def fetch_comments(client, permalink, opts \\ @default_options) do
    client
    |> Tesla.get(permalink, query: opts)
  end
end
