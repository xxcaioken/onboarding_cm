defmodule OnboardingCm.BLL.TagContextTest do
  use OnboardingCm.RepoCase

  alias OnboardingCm.BLL.{TagContext, ProductContext, CollectionContext}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(OnboardingCm.Repo)
  end

  describe "gestão de tags" do
    test "criando uma tag", %{test: test} do

      IO.puts("=========== Iniciando teste de TagContext ===========")

      attrs = %{name: "Tag infantil", value: "Publico: infantil", description: "Descrição da nova tag"}

      assert {:ok, tag} = TagContext.create(attrs)
      assert tag.name == "Tag infantil"
      assert tag.value == "Publico: infantil"
      assert tag.description == "Descrição da nova tag"
    end
  end
end
