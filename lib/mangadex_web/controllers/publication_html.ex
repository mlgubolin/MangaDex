defmodule MangadexWeb.PublicationHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use MangadexWeb, :html

  embed_templates "publication_html/*"
end
