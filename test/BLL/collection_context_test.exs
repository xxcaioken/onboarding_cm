defmodule OnboardingCm.BLL.CollectionContextTest do
  use OnboardingCm.RepoCase

  alias OnboardingCm.BLL.CollectionContext

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(OnboardingCm.Repo)
  end

  describe "gestão de coleções" do
    test "criar uma coleção com dados válidos", %{test: test} do
      IO.puts("=========== Iniciando testes de CollectionContext ===========")

      IO.puts("#{test}")

      attrs = %{
        name: "Verão 2025",
        year: 2025,
        season: "Verão",
        release_date: ~D[2025-03-15]
      }

      assert {:ok, collection} = CollectionContext.create(attrs)
      assert collection.name == "Verão 2025"
      assert collection.year == 2025
    end

    test "não criar coleção com dados inválidos", %{test: test} do
      IO.puts("#{test}")

      attrs = %{name: nil, year: nil, season: nil, release_date: nil}
      assert {:error, %Ecto.Changeset{}} = CollectionContext.create(attrs)
    end

    test "listar todas as coleções", %{test: test} do
      IO.puts("#{test}")

      collection1 =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      collection2 =
        CollectionContext.create!(%{
          name: "Inverno 2025",
          year: 2025,
          season: "Inverno",
          release_date: ~D[2025-06-15]
        })

      collections = CollectionContext.list_collections()
      assert length(collections) == 2
    end

    test "buscar coleção por ID", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      found = CollectionContext.get_collection!(collection.id)
      assert found.id == collection.id
      assert found.name == "Verão 2025"
    end

    test "atualizar dados de uma coleção", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      update_attrs = %{name: "Verão 2025 Atualizada", release_date: ~D[2025-04-15]}

      assert {:ok, updated} = CollectionContext.update_collection(collection, update_attrs)
      assert updated.name == "Verão 2025 Atualizada"
      assert updated.release_date == ~D[2025-04-15]
    end

    test "deletar uma coleção", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      assert {:ok, _} = CollectionContext.delete_collection(collection)
      assert CollectionContext.get_collection!(collection.id) == nil
    end
  end
end
