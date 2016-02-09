defmodule Rumbl.VideoTest do
  use Rumbl.ModelCase

  alias Rumbl.Video

  @valid_attrs %{description: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "slugify the video" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.changes.slug == "some-content"
  end

  test "overriding to_param" do
    video = %Video{id: 1, slug: "slug"}
    assert Rumbl.Router.Helpers.watch_path(%URI{}, :show, video) == "/watch/1-slug"
  end
end
