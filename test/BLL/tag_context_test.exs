defmodule OnboardingCm.BLL.TagContextTest do
  use OnboardingCm.RepoCase

  alias OnboardingCm.BLL.TagContext

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(OnboardingCm.Repo)
  end

  describe "gestão de tags" do
    test "criando uma tag", %{test: test} do
      IO.puts("=========== Iniciando teste de TagContext ===========")

      IO.puts("#{test}")

      attrs = %{
        name: "Tag infantil",
        value: "Publico: infantil",
        description: "Descrição da nova tag"
      }

      assert tag = TagContext.create!(attrs)
      assert tag.name == "Tag infantil"
      assert tag.value == "Publico: infantil"
      assert tag.description == "Descrição da nova tag"
    end

    test "não criar tag com dados inválidos", %{test: test} do
      IO.puts("#{test}")

      attrs = %{name: nil, value: nil, description: nil}
      assert {:error, %Ecto.Changeset{}} = TagContext.create(attrs)
    end

    test "listar todas as tags", %{test: test} do
      IO.puts("#{test}")

      tag1 =
        TagContext.create!(%{
          name: "Tag infantil",
          value: "Publico: infantil",
          description: "Descrição da tag infantil"
        })

      tag2 =
        TagContext.create!(%{
          name: "Tag adulto",
          value: "Publico: adulto",
          description: "Descrição da tag adulto"
        })

      tags = TagContext.list_tags()
      assert length(tags) == 2
    end

    test "buscar tag por ID", %{test: test} do
      IO.puts("#{test}")

      tag =
        TagContext.create!(%{
          name: "Tag buscada",
          value: "Publico: buscado",
          description: "Descrição da tag buscada"
        })

      found = TagContext.get_tag!(tag.id)
      assert found.id == tag.id
      assert found.name == "Tag buscada"
    end

    test "atualizar dados de uma tag", %{test: test} do
      IO.puts("#{test}")

      tag =
        TagContext.create!(%{
          name: "Tag original",
          value: "Publico: original",
          description: "Descrição original"
        })

      update_attrs = %{name: "Tag atualizada", value: "Publico: atualizado"}

      assert updated = TagContext.update_tag!(tag, update_attrs)
      assert updated.name == "Tag atualizada"
      assert updated.value == "Publico: atualizado"
    end

    test "deletar uma tag", %{test: test} do
      IO.puts("#{test}")

      tag =
        TagContext.create!(%{
          name: "Tag deletada",
          value: "Publico: deletado",
          description: "Descrição da tag deletada"
        })

      assert _ = TagContext.delete_tag!(tag)
      assert TagContext.get_tag!(tag.id) == nil
    end
  end
end
